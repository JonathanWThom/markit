class DjiaData
  def generate_prediction 
    CreatePricesFromFile.new(file.path).build_from_csv
    file.unlink

    PredictionUpdater.new(Prediction.last).set_actual_values

    PredictionCreator.new.build_most_recent
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
