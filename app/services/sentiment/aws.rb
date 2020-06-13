module Sentiment
  class Aws
    def batch_sentiment(text_list)
      limited_list = text_list[0..24]
      client.batch_detect_sentiment(
        text_list: limited_list,
        language_code: "en"
      )
    end

    private

    def creds
      Rails.application.credentials.aws[:comprehend]
    end

    def credentials
      ::Aws::Credentials.new(creds[:access_key_id], creds[:secret_access_key])
    end

    def client
      ::Aws::Comprehend::Client.new(
        region: creds[:region],
        credentials: credentials,
      )
    end
  end
end
