class DjiaData
  def generate_prediction 
    original_price_count = Price.close.djia.count
    CreatePricesFromFile.new(file.path).build_from_csv

    return if Price.close.djia.count == original_price_count

    file.unlink

    PredictionUpdater.new(Prediction.last).set_actual_values

    PredictionCreator.new.build_most_recent

    MlModels::DjiaClose.new.generate_accuracy_report
  end

  private

  def file
    @_file ||= begin
      current_time = Time.new.to_i
      url = "https://query1.finance.yahoo.com/v7/finance/download/%5EDJI?period1=475804800&period2=#{current_time}&interval=1d&events=history"

      csv = `curl --url '#{url}'`

      file = Tempfile.new('foo')
      file.write(csv)
      file.close

      file
    end
  end
end
