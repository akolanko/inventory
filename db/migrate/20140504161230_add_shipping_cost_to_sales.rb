class AddShippingCostToSales < ActiveRecord::Migration
  def change
  	add_column :sales, :shipping_cost, :integer
  end
end
