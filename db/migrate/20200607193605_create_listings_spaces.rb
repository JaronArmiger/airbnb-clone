class CreateListingsSpaces < ActiveRecord::Migration[6.0]
  def change
    create_table :listings_spaces, id: false do |t|
    	t.belongs_to :listing
    	t.belongs_to :space
    end
  end
end
