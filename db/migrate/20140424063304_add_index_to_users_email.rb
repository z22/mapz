class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
    #ensures that if user accidentally creates multiple accounts with the same address, the database will only allow one
    #also, having an index will allow a faster search of the database by email when the user is logging in
    add_index :users, :email, unique: true
  end
end
