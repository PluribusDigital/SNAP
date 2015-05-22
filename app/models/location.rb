class Location
  def initialize(lat: 38.8976757, long: -77.036528)
    @latitude = lat
    @longitude = long
  end
  attr_reader :latitude, :longitude
  alias lat latitude
  alias long longitude
  
  def to_s
    [lat, long].join(', ')
  end
end