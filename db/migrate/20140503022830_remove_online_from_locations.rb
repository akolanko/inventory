class RemoveOnlineFromLocations < ActiveRecord::Migration
  def change
  	remove_column :locations, :online, :string
  end
end
