class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :admin, :boolean
    add_column :users, :image, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :birthday, :date
    add_column :users, :interests, :string
    add_column :users, :skills, :text
    add_column :users, :department, :string
    add_column :users, :linkedin, :string
    #this is for oauth but will be blank cos no oauth
    add_column :users, :provider, :string
    add_column :users, :uid, :string
  end
end
