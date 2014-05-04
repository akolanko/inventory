class AddShippingPaidToSales < ActiveRecord::Migration
  def change
  	add_column :sales, :shipping_paid, :integer
  end
end
