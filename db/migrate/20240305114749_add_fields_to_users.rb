class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :username, :string
    add_column :users, :password_digest, :string
    add_column :users, :email, :string
    add_column :users, :interest, :text
    add_column :users, :about_me, :text
  end
end
