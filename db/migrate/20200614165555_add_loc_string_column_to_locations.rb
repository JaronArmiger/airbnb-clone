class AddLocStringColumnToLocations < ActiveRecord::Migration[6.0]
  def change
  	add_column :locations, :loc_string, :string
  end
end
