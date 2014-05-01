class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :location
      t.datetime :return_date
      t.string :contact_name
      t.string :contact_email
      t.integer :contact_phone

      t.timestamps
    end
  end
end
