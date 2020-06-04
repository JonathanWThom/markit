class PredictionPresenter < SimpleDelegator
  alias :prediction :__getobj__

  def self.wrap(predictions)
    predictions.map { |p| PredictionPresenter.new(p) }
  end

  def actual_price
    "$#{prediction.actual_price.round(2)}"
  end

  def actual_change_percentage
    "#{percentage(actual_change).round(2)}%"
  end

  def actual_change_class
    change_class(actual_change_percentage)
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

  def change_class(change = percentage)
    percentage = percentage(change)

    return "green" if percentage > 0
    return "gray" if percentage == 0
    return "red" if percentage < 0
  end

  def date
    prediction.price.date.strftime("%B %e, %Y")
  end

  private

  def percentage(change = projected_change)
   (change.to_f * 100)
  end
end
