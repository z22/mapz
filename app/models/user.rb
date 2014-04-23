class User < ActiveRecord::Base
  extend Geocoder::Model::ActiveRecord

  validates_presence_of :name
  validates_presence_of :address

  geocoded_by :address
  after_validation :geocode #auto-fetch coordinates

end
