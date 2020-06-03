class PredictionPresenter < SimpleDelegator
  alias :prediction :__getobj__

  def self.wrap(predictions)
    predictions.map { |p| PredictionPresenter.new(p) }
  end

  def actual_price
    "$#{prediction.actual_price.round(2)}"
  end

  def projected_price
    "$#{prediction.projected_price.round(2)}"
  end

  def formatted_price
    "$#{prediction.price.amount.to_f}"
  end

  def change_percentage
    "#{percentage.round(2)}%"
  end

  def date
    # could wrap this in date formatter 
    prediction.price.date
  end

  private

  def percentage
   (projected_change.to_f * 100)
  end
end
