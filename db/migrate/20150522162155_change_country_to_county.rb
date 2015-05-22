class ChangeCountryToCounty < ActiveRecord::Migration
  def change
    rename_column :retailers, :country, :county 
  end
end
