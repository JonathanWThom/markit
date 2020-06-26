class SentimentCreator
  def nyt_headlines_us
    Nlp::News.new.headlines_us.each do |sentiment_params|
      Sentiment.create(sentiment_params)
    end
  end
end
