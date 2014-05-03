class AddOnlineToLocation < ActiveRecord::Migration
  def change
  	add_column :locations, :online, :string
  end
end
