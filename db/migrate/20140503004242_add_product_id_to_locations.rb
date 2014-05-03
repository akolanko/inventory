class AddProductIdToLocations < ActiveRecord::Migration
  def change
	add_column :locations, :product_id, :integer
  end
end
