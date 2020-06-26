module NyTimes
  class Provider
    attr_reader :client
    def initialize
      @client = Client.new 
    end

    def headlines_us
      results = client.top_stories_us.parsed_response["results"]
      limited_results = results[0..24]
      titles = limited_results.map { |r| r["title"] }
      abstracts = limited_results.map { |r| r["abstract"] }

      limited_results.map do |r|
        "#{r["title"]}: #{r["abstract"]}"
      end
    end
  end
end
