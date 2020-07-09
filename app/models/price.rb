# frozen_string_literal: true
 
class Price < ApplicationRecord
  include ActsAsMarketRecordable

  validates_uniqueness_of :date, scope: [ :market_timing, :symbol ]

  has_many :predictions
end
