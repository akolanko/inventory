class ChangeDataTypeForSalePrice < ActiveRecord::Migration
  def change
  	change_column :sales, :price, :float
  end
end
