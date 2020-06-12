class PredictionPresenter < SimpleDelegator
  alias :prediction :__getobj__

  def self.wrap(predictions, symbol, market_timing)
    predictions.send(parsed_symbol(symbol)).send(parsed_market_timing(market_timing)).map do |p|
      PredictionPresenter.new(p)
    end
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

  class << self
    private

    def parsed_symbol(symbol)
      symbol.to_sym if [:djia, :spx].include?(symbol.to_sym)
    end

    def parsed_market_timing(market_timing)
      market_timing.to_sym if [:close].include?(market_timing.to_sym)
    end
  end

  private

  def percentage(change = projected_change)
   (change.to_f * 100)
  end
end
