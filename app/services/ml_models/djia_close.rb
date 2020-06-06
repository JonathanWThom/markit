module MlModels
  class DjiaClose
    def train
      data = []
      prices.each_with_index do |price, index|
        if next_day(index).present? && previous_day(index).present?
          data << {
            date: price[:date],
            next_day_change: next_day_change(price, index), 
            change_from_previous_day: change_from_previous_day(price, index),
          }
        end
      end

      puts data

      write_model(data)
    end

    def predict(price_record)
      index = prices.index { |price| price[:date] == price_record.date }
     
      if previous_day(index).present?
        prediction = model.predict(change_from_previous_day: change_from_previous_day(prices[index], index))
        puts "Price on #{prices[index][:date]}: #{prices[index][:amount].to_f}"
        puts "Expected change on next trading day: #{(prediction * 100).round(2)}%"
        next_day = (1 + prediction) * prices[index][:amount].to_f
        puts "Expect price on next trading day: #{next_day.round(2)}"
        actual = prices[index + 1]
        if actual.present?
          puts "Actual price: #{actual[:amount].to_f}"
        end

        prediction
      end
    end

    def generate_accuracy_report
      predictions = Prediction.where.not(actual_change: nil)
      actual = predictions.pluck(:actual_change)
      predicted = predictions.pluck(:projected_change)
      metrics = Eps.metrics(actual, predicted)
      puts metrics

      AccuracyReport.create!(metrics.merge(model: :djia_close))
    end

    private

    def change_from_previous_day(price, index)
      price[:amount] / previous_day_price(index) - 1
    end

    def next_day_change(price, index)
      price[:amount] / next_day_price(index) - 1
    end

    def previous_day(index)
      prices[index - 1]
    end

    def previous_day_price(index)
      previous_day(index)[:amount]
    end

    def next_day(index)
      prices[index + 1]
    end

    def next_day_price(index)
      next_day(index)[:amount]
    end

    def prices 
      @_prices ||= begin
        Price.close.djia.order(:date).pluck(:amount, :date).map do |data|
          {
            amount: data[0],
            date: data[1]
          }
        end
      end
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
