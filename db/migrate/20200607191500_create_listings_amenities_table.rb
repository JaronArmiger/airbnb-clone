class CreateListingsAmenitiesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :amenities_listings, id: false do |t|
    	t.belongs_to :listing
    	t.belongs_to :amenity
    end
  end
end
