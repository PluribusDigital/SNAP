class Boundary
  def initialize(north_west:, south_east:)
    @north_west = north_west
    @south_east = south_east
  end
  attr_reader :north_west, :south_east
  
  def west
    north_west.latitude
  end
  
  def north
    north_west.longitude
  end
  
  def east
    south_east.latitude
  end
  
  def south
    south_east.longitude
  end
end