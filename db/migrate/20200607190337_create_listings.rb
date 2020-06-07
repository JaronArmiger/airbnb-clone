class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.text :description
      t.string :title
      t.integer :bathrooms
      t.integer :beds
      t.integer :guests

      t.timestamps
    end
  end
end
