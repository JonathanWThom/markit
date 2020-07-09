class PredictionTallyReport < ApplicationRecord 
  include ActsAsMarketRecordable

  scope :ordered, -> { order(created_at: :desc) }
  scope :djia, -> { where(symbol: :djia) }
  scope :spx, -> { where(symbol: :spx) }
  scope :close, -> { where(market_timing: :close) }

  def self.last
    ordered.last
  end
end
