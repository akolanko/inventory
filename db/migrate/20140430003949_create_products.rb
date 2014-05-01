class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :color
      t.text :measurements
      t.integer :price
      t.integer :inventory
      t.boolean :soldout
      t.string :location
      t.integer :category_id

      t.timestamps
    end
  end
end
