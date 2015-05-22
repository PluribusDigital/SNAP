json.meta "sample meta"
json.retailers do
  json.array!(@retailers) do |retailer|
    json.extract! retailer, :id, :name, :longitude, :latitude, :address1, :address2, :city, :state, :zip5, :zip4, :county
    json.url retailer_url(retailer, format: :json)
  end
end
