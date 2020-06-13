module NyTimes
  class Provider
    attr_reader :client
    def initialize
      @client = Client.new 
    end

    def headlines_us
      results = client.top_stories_us.parsed_response["results"]
      titles = results.map { |r| r["title"] }
      abstracts = results.map { |r| r["abstract"] }
      (titles + abstracts).flatten
    end
  end
end
