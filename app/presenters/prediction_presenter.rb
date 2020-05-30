class PredictionPresenter < SimpleDelegator
  alias :prediction :__getobj__
  def projected_price
    "$#{((1 + percentage) * prediction.price.amount.to_f).round(2)}"
  end

  def price
    "$#{prediction.price.amount.to_f}"
  end

  def change_percentage
    "#{percentage}%"
  end

  def date
    # could wrap this in date formatter 
    prediction.date
  end

  private

  def percentage
   (projected_change.to_f * 100)
  end
end
