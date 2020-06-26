class Sentiment < ApplicationRecord
  enum source: { nyt_headlines_us: 0 }

  validates_uniqueness_of :text, scope: :source
end
