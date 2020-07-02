class AverageSentiment < ApplicationRecord
  enum source: { nyt_headlines_us: 0 }
  enum trait: { positive: 0, negative: 1, neutral: 2, mixed: 3}

  validates_uniqueness_of :value, scope: [:source, :trait, :date]

  def self.to_csv
    CSV.generate do |csv|
      csv << self.attribute_names
      self.find_each do |record|
        csv << record.attributes.values
      end
    end
  end
end
