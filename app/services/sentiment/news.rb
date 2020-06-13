module Sentiment
  class News
    def headlines_us
      headlines = ::News.new.headlines_us
      client = Sentiment::Aws.new
      puts client.batch_sentiment(headlines)
    end
  end
end
