class RenameZipcode < ActiveRecord::Migration[6.0]
  def change
  	rename_column :locations, :zipcode, :postal_code
  end
end
