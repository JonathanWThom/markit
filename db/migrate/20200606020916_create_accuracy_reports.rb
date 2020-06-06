class CreateAccuracyReports < ActiveRecord::Migration[6.0]
  def change
    create_table :accuracy_reports do |t|
      t.integer :model, null: false, index: true
      t.decimal :rmse
      t.decimal :mae
      t.decimal :me

      t.timestamps
    end
  end
end
