class PredictionUpdater
  attr_reader :prediction
  def initialize(prediction)
    @prediction = prediction
  end

  def set_actual_values
    if prediction.present?
      next_day_price = Price.find_by(
        date: prediction.date + 1.day,
        market_timing: prediction.market_timing,
        symbol: prediction.symbol,
      )
      if next_day_price.present?
        actual_change = (next_day_price.amount / prediction.price.amount) - 1

        prediction.update(
          actual_change: actual_change,
          actual_price: next_day_price.amount, 
        )
      end
    end
  end
end
