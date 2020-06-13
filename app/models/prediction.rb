class Prediction < ApplicationRecord
  belongs_to :price

  scope :djia, -> { joins(:price).where(prices: { symbol: :djia })}
  scope :spx, -> { joins(:price).where(prices: { symbol: :spx })}
  scope :close, -> { joins(:price).where(prices: { market_timing: :close })}

  delegate :symbol, :market_timing, :date, to: :price
end
