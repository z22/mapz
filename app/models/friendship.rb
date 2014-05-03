class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User" #tell Rails to look for the foreign key corresponding to user_id in the Friendship table


# Return true if the users are friends.
def self.exists?(user, friend)
  not find_by_user_id_and_friend_request(user, friend).nil?
end

# Record a pending friend request.
def self.request(user, friend)

  unless user == friend or Friendship.exists?(user, friend)
    transaction do #ensures both actions occur or neither occur
      create(:user => user, :friend => friend, :status => 'pending')
      create(:user => friend, :friend => user, :status => 'requested')
    end
  end
end

# Accept a friend request.
def self.accept(user, friend)
  transaction do
    accepted_at = Time.now
    accept_one_side(user, friend, updated_at)
    accept_one_side(friend, user, updated_at)
  end
end

# Delete a friendship or cancel a pending request.
def self.breakup(user, friend)
  transaction do
    destroy(find_by_user_id_and_friend_id(user, friend))
    destroy(find_by_user_id_and_friend_id(friend, user))
  end
end

private

# Update the db with one side of an accepted friendship request.
def self.accept_one_side(user, friend, updated_at)
  request = find_by_user_id_and_friend_id(user, friend)
  request.status = 'accepted'
  request.updated_at = updated_at
  request.save!
end

end
