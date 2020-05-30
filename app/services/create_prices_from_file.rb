require "csv"

# Sources
# DJIA: https://finance.yahoo.com/quote/%5EDJI/history?period1=475804800&period2=1590710400&interval=1d&filter=history&frequency=1d

class CreatePricesFromFile
  attr_reader :path, :market_timing, :symbol
  def initialize(
    path = Rails.root.join("lib", "djia_prices.csv"),
    market_timing = :close, 
    symbol = :djia 
  )
    @path = path
    @market_timing = market_timing
    @symbol = symbol
  end

  def build_from_csv
    CSV.foreach(path, headers: true) do |row|
      Price.create!(
        amount: row["Close"],
        date: row["Date"],
        market_timing: market_timing,
        symbol: symbol,
      )
    end
  end
end
