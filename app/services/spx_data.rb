class SpxData < DataGenerator
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
