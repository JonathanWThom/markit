class DataGenerator
  def generate_prediction 
    original_price_count = Price.send(market_timing).send(symbol).count
    CreatePricesFromFile.new(file.path, market_timing, symbol).build_from_csv

    return if Price.send(market_timing).send(symbol) == original_price_count

    file.unlink

    PredictionUpdater.new(Prediction.send(symbol).last).set_actual_values

    PredictionCreator.new(model_class, market_timing, symbol).build_most_recent

    model = model_class.new
    model.generate_accuracy_report
    model.generate_prediction_tally_report
  end

  private

  def current_time
    Time.new.to_i
  end

  def model_class 
    raise NotImplementedError
  end

  def market_timing
    raise NotImplementedError
  end

  def symbol
    raise NotImplementedError
  end

  def file
    @_file ||= begin
      csv = `curl --url '#{url}'`

      file = Tempfile.new
      file.write(csv)
      file.close

      file
    end
  end

  def url
    raise NotImplementedError
  end
end
