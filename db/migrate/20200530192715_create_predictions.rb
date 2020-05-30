class CreatePredictions < ActiveRecord::Migration[6.0]
  def change
    create_table :predictions do |t|
      t.date :date, null: false, index: true
      t.decimal :projected_change, null: false
      t.timestamps
    end
  end
end
