class SpxData < DataGenerator
  def generate_prediction
    url = "https://query1.finance.yahoo.com/v7/finance/download/%5EVIX?period1=1560313119&period2=#{current_time}&interval=1d&events=history"
    csv = `curl --url '#{url}'`
    vix_file = Tempfile.new
    vix_file.write(csv)
    CreatePricesFromFile.new(vix_file.path, :close, :vix).build_from_csv

    super
  end

  private

  def model_class
    MlModels::SpxClose
  end

  def market_timing
    :close
  end

  def symbol
    :spx
  end

  def url
    "https://query1.finance.yahoo.com/v7/finance/download/%5EGSPC?period1=-1325635200&period2=#{current_time}&interval=1d&events=history"
  end
end
