class CreateRetailers < ActiveRecord::Migration
  def change
    create_table :retailers do |t|
      t.string :name
      t.string :longitude
      t.string :latitude
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip5
      t.string :zip4
      t.string :country

      t.timestamps null: false
    end
  end
end
