class DjiaData < DataGenerator
  private

  def model_class
    MlModels::DjiaClose
  end

  def market_timing
    :close
  end

  def symbol
    :djia
  end

  def url
    url = "https://query1.finance.yahoo.com/v7/finance/download/%5EDJI?period1=475804800&period2=#{current_time}&interval=1d&events=history"
  end
end
