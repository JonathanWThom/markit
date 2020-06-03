class AddActualToPredictions < ActiveRecord::Migration[6.0]
  def change
    add_column :predictions, :actual_change, :decimal 
  end
end
