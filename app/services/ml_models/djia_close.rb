module MlModels
  class DjiaClose
    def train
      data = []
      prices.each_with_index do |price, index|
        close = price[0].to_f
        next_day = prices[index + 1]
        previous_day = prices[index - 1]

        if next_day.present? && previous_day.present?
          next_day_price = next_day[0].to_f
          previous_day_price = previous_day[0].to_f
          change_from_previous_day = close / previous_day_price
          next_day_change = close / next_day_price

          puts "Close: #{close}"
          puts "Previous Day Price: #{previous_day_price}"
          puts "Change from Previous Day: #{change_from_previous_day - 1}"
          puts "Next Day Price: #{next_day_price}"
          puts "Next Day Change: #{next_day_change - 1}"
          puts "\n\n"

          data << {
            date: price[1],
            next_day_change: next_day_change - 1, 
            change_from_previous_day: change_from_previous_day - 1,
          }
        end
      end

      write_model(data)
    end

    def predict(price_record)
      index = prices.index { |price| price[1] == price_record.date }
      previous_day = prices[index - 1]
     
      if previous_day.present?
        change_from_previous_day = prices[index][0].to_f / previous_day[0].to_f
        model.predict(change_from_previous_day: change_from_previous_day - 1)
      end
    end

    private

    def prices 
      @_prices ||= Price.close.djia.order(:date).pluck(:amount, :date)
    end

    def model_file
      File.join(Rails.root, "lib", "djia_price_model.pmml")
    end

    def model
      @model ||= Eps::Model.load_pmml(File.read(model_file))
    end

    def write_model(data)
      generated_model = Eps::Model.new(data, target: :next_day_change, split: :date)
      File.write(model_file, generated_model.to_pmml)

      puts generated_model.summary
    end
  end
end
