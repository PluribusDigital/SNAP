class SnapRetailerService
  # DOCS & DATA http://www.fns.usda.gov/snap/retailerlocator
  
  def self.file_location
    "data/store_locations_2015_05_05_2.csv"
  end

  def self.import_data
    cols = [:name,:longitude,:latitude,:address1,:address2,:city,:state,:zip5,:zip4,:county]
    CSV.foreach(file_location, headers:false) do |row|
      Retailer.create(Hash[cols.zip row]) #if row[6]=="VA" # limit to only virginia for initial prototype purpose
    end
  end

end