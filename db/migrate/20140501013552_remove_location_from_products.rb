class RemoveLocationFromProducts < ActiveRecord::Migration
  def change
  	remove_column :products, :location, :string
  end
end
