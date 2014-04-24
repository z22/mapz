class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.column :name, :string
      t.column :image_url, :string
      t.column :next_date, :string
      t.column :chat_platform, :string
      t.column :notes, :text

      t.references :user
      t.timestamps
    end
  end
end
