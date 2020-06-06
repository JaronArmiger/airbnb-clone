class ChangeCountryToCountryCode < ActiveRecord::Migration[6.0]
  def change
  	rename_column :locations, :country, :country_code
  end
end
