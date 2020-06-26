module Nlp 
  class News
    def headlines_us
      headlines = ::News.new.headlines_us
      client = Nlp::Aws.new
      sentiments = client.batch_sentiment(headlines)

      sentiments[:result_list].each_with_index.map do |result, i|
        {
          source: :nyt_headlines_us,
          text: headlines[i],
          sentiment: result.sentiment,
          positive: result.sentiment_score.positive,
          neutral: result.sentiment_score.neutral,
          negative: result.sentiment_score.negative,
          mixed: result.sentiment_score.mixed,
        }
      end
    end
  end
end
