class News
  attr_reader :provider
  def initialize(provider = NyTimes::Provider)
    @provider = provider.new
  end

  def headlines_us
    provider.headlines_us
  end
end
