class CreatePrices < ActiveRecord::Migration[6.0]
  def change
    create_table :prices do |t|
      t.integer :symbol, default: 0, null: false, index: true
      t.decimal :amount, precision: 8, scale: 2, null: false, index: true
      t.integer :market_timing, default: 0, null: false, index: true
      t.date :date, null: false, index: true
      t.timestamps
    end
  end
end
