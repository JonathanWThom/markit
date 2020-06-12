require "csv"

class CreatePricesFromFile
  attr_reader :path, :market_timing, :symbol
  def initialize(path, market_timing, symbol)
    @path = path
    @market_timing = market_timing
    @symbol = symbol
  end

  def build_from_csv
    CSV.foreach(path, headers: true) do |row|
      # Fail duplicate validations silently so that this can be run on new
      # datasets
      Price.create(
        amount: row["Close"],
        date: row["Date"],
        market_timing: market_timing,
        symbol: symbol,
      )
    end
  end
end
