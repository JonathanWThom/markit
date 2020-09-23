class AverageSentimentCreator
  def nyt_headlines_us 
    sentiments = Sentiment.all
    date_set = sentiments.group_by_day(:created_at).count

    date_set.keys.each do |date|
      next if AverageSentiment.find_by(date: date).present?

      targets = sentiments.select { |s| s.created_at.to_date == date }

      [:positive, :negative, :neutral, :mixed].each do |trait|
        if targets.present?
          create_average_sentiment(targets, date, trait)
        end
      end
    end
  end

  private

  def create_average_sentiment(targets, date, trait)
    avg = targets.map { |t| t.send(trait) }.reduce(:+) / targets.count
    AverageSentiment.create(date: date, source: :nyt_headlines_us, trait: trait, value: avg)
  end
end
