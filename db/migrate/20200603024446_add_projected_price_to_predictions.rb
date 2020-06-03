class AddProjectedPriceToPredictions < ActiveRecord::Migration[6.0]
  def change
    add_column :predictions, :projected_price, :decimal
    add_column :predictions, :actual_price, :decimal
  end
end
