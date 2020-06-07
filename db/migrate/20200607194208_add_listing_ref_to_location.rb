class AddListingRefToLocation < ActiveRecord::Migration[6.0]
  def change
  	add_reference :locations, :listing, foreign_key: true
  	change_column_null :locations, :listing_id, false
  end
end
