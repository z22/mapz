class User < ActiveRecord::Base
  attr_accessor :password

  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password

  geocoded_by :address
  after_validation :geocode #auto-fetch coordinates

end
