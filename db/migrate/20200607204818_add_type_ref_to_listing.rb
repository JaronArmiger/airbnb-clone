class AddTypeRefToListing < ActiveRecord::Migration[6.0]
  def change
  	add_reference :listings, :type, foreign_key: true
  	change_column_null :listings, :type_id, false
  end
end
