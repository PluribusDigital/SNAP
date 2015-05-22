class Retailer < ActiveRecord::Base
  acts_as_mappable default_units: :miles

  alias_attribute :lat, :latitude
  alias_attribute :lng, :longitude
end
