require 'geokit/lat_lng'
require 'delegate'
class Location < DelegateClass(Geokit::LatLng)
  def initialize(lat=38.8976757,lng=-77.036528)
    super(Geokit::LatLng.new(lat, lng))
  end
end