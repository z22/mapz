class Group < ActiveRecord::Base

  # has_and_belongs_to_many :users
  acts_as_group :members => [:users, :assignments], :default_members => :users


end
