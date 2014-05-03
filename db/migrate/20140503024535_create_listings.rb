class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :website
      t.datetime :posted_date
      t.integer :product_id

      t.timestamps
    end
  end
end
