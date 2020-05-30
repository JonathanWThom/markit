# frozen_string_literal: true
 
class Price < ApplicationRecord
  enum market_timing: { close: 0 }
  enum symbol: { djia: 0 }
  validates_uniqueness_of :date, scope: [ :market_timing, :symbol ]
end
