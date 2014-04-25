class CreateGroupsUsersJoinTable < ActiveRecord::Migration
  def change
    create_join_table :groups, :users, id: false do |t|
      t.index :group_id
      t.index :user_id
    end
  end
end
