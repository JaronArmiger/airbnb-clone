class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :country
      t.string :city
      t.string :street
      t.integer :street_number
      t.integer :zipcode

      t.timestamps
    end
  end
end
