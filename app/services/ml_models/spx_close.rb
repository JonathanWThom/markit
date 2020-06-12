module MlModels
  class SpxClose < Base
    def train
      data = []
      prices.each_with_index do |price, index|
        if next_day(index).present? && previous_day(index).present? && vix(price).present?
          data << {
            date: price[:date],
            next_day_change: next_day_change(price, index), 
            change_from_previous_day: change_from_previous_day(price, index),
            vix: vix(price),
          }
        end
      end

      puts data

      write_model(data)
    end

    def predict(price_record)
      index = prices.index { |price| price[:date] == price_record.date }
     
      if previous_day(index).present?
        model.predict(
          change_from_previous_day: change_from_previous_day(prices[index], index),
          vix: vix(previous_day(index)),
        )
      end
    end

    private

    def vix(price)
      date = price[:date]
      Price.vix.close.find_by(date: date)&.amount
    end

    def symbol
      :spx
    end

    def market_timing
      :close
    end

    def filename
      "spx_close_model.pmml"
    end

    def report_model
      :spx_close
    end
  end
end
