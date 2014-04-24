class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.float :latitude
      t.float :longitude
      t.string :address
      t.text :notes
      t.string :name
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.references :group

      t.timestamps
    end
  end
end
