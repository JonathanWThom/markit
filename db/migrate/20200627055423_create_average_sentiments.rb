class CreateAverageSentiments < ActiveRecord::Migration[6.0]
  def change
    create_table :average_sentiments do |t|
      t.integer :trait
      t.integer :source
      t.decimal :value
      t.date :date

      t.timestamps
    end
  end
end
