# frozen_string_literal: true
 
class Price < ApplicationRecord
  enum market_timing: { close: 0 }
  enum symbol: { djia: 0, spx: 1, vix: 2 }
  validates_uniqueness_of :date, scope: [ :market_timing, :symbol ]

  has_many :predictions
end
