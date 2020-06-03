class PredictionUpdater
  attr_reader :prediction
  def initialize(prediction)
    @prediction = prediction
  end

  def set_actual_values
    if prediction.present?
      next_day_price = Price.find_by(date: prediction.price.date + 1.day)
      if next_day_price.present?
        actual_change = (prediction.price.amount / next_day_price.amount) - 1

        prediction.update(
          actual_change: actual_change,
          actual_price: next_day_price.amount, 
        )
      end
    end
  end
end
