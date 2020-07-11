class PredictionTallyReport < ApplicationRecord 
  include ActsAsMarketRecordable

  scope :ordered, -> { order(created_at: :desc) }

  def self.last
    ordered.last
  end
end
