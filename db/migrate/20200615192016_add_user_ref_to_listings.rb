class AddUserRefToListings < ActiveRecord::Migration[6.0]
  def change
  	add_column :listings, :host_id, :bigint
  	change_column_null :listings, :host_id, false
  end
end
