class SnapRetailerService
  # DOCS & DATA http://www.fns.usda.gov/snap/retailerlocator
  
  def self.file_location
    "data/store_locations_2015_05_05_2.csv"
  end

  def self.import_data
    csv = CSV.parse( File.read(file_location) , headers:true )
    csv = csv.select{|r|r[6]=="VA"}
    csv.each do |row|
      Retailer.create(
        name: row[0], 
        longitude: row[1], 
        latitude: row[2], 
        address1: row[3], 
        address2: row[4], 
        city: row[5], 
        state: row[6], 
        zip5: row[7], 
        zip4: row[8], 
        county: row[9] 
      )
    end
  end

end