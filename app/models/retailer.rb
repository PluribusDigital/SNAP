class Retailer < ActiveRecord::Base
  acts_as_mappable default_units: :miles,
                   lat_column_name: :latitude,
                   lng_column_name: :longitude

  alias_attribute :lat, :latitude
  alias_attribute :lng, :longitude
end
