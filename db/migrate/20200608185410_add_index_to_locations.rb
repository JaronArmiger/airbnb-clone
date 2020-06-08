class AddIndexToLocations < ActiveRecord::Migration[6.0]
  def change
  	remove_index :locations, :listing_id
  	add_index :locations, :listing_id, unique: true
  end
end
