class Retailer < ActiveRecord::Base
  def self.within(boundary)
    self.where(latitude: boundary.west..boundary.east, longitude: boundary.north..boundary.south)
  end
end
