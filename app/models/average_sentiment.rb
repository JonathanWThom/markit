class AverageSentiment < ApplicationRecord
  enum source: { nyt_headlines_us: 0 }
  enum trait: { positive: 0, negative: 1, neutral: 2, mixed: 3}

  validates_uniqueness_of :value, scope: [:source, :trait, :date]
end
