class PredictionCreator
  # group these together?
  attr_reader :model_class, :market_timing, :symbol
  def initialize(model_class, market_timing, symbol)
    @model_class = model_class
    @market_timing = market_timing
    @symbol = symbol
  end

  def build_most_recent
    price = Price.send(market_timing).send(symbol).order(:date).last

    ml = model_class.new
    ml.train
    prediction = ml.predict(price)
    projected_price = price.amount * (1 + prediction)

    Prediction.create!(
      price: price,
      projected_change: prediction,
      projected_price: projected_price,
    )
  end
end
