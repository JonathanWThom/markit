class CreateSentiments < ActiveRecord::Migration[6.0]
  def change
    create_table :sentiments do |t|
      t.integer :source
      t.text :text
      t.string :sentiment
      t.decimal :positive
      t.decimal :neutral
      t.decimal :negative
      t.decimal :mixed

      t.timestamps
    end
  end
end
