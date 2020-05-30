class CreatePredictions < ActiveRecord::Migration[6.0]
  def change
    create_table :predictions do |t|
      t.belongs_to :price, foreign_key: true, index: true
      t.decimal :projected_change, null: false
      t.timestamps
    end
  end
end
