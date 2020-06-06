class AddCountryToLocation < ActiveRecord::Migration[6.0]
  def change
  	add_column :locations, :country, :string
  end
end
