module Sentiment
  class News
    def headlines_us
      headlines = ::News.new.headlines_us
      client = Sentiment::Aws.new
      sentiments = client.batch_sentiment(headlines)

      results = sentiments[:result_list]
      headlines.each_with_index do |headline, index|
        puts headline
        puts results[index]
        puts "\n"
      end

      true
      #results
    end
  end
end
