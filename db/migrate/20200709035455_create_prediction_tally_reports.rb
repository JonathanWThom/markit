class CreatePredictionTallyReports < ActiveRecord::Migration[6.0]
  def change
    create_table :prediction_tally_reports do |t|
      t.integer :market_timing, null: false
      t.integer :symbol, null: false
      t.integer :total, null: false
      t.integer :correct, null: false

      t.timestamps
    end
  end
end
