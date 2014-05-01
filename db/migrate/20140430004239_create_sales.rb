class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :price
      t.string :through
      t.datetime :date
      t.integer :product_id

      t.timestamps
    end
  end
end
