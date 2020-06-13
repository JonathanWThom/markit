module NyTimes
  class Client
    include HTTParty
    base_uri "api.nytimes.com/svc/"

    def initialize
      @options = { query: { "api-key": Rails.application.credentials.ny_times[:api_key] } }
    end

    def top_stories_us
      self.class.get("/topstories/v2/us.json", options)
    end

    private

    attr_reader :options
  end
end
