class AddUserIdAndNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string
    add_column :users, :user_name, :string, unique: true
  end
end
