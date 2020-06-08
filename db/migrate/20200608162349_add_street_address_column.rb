class AddStreetAddressColumn < ActiveRecord::Migration[6.0]
  def change
  	remove_column :locations, :street, :string
  	remove_column :locations, :street_number, :integer
  	add_column :locations, :street_address, :string
  end
end
