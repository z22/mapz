class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User" #tell Rails to look for the foreign key corresponding to user_id in the Friendship table

end
