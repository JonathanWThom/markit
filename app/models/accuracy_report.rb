class AccuracyReport < ApplicationRecord
  enum model: { djia_close: 0, spx_close: 0 } 
end
