class AddOmniauthColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :expires, :boolean
    add_column :users, :refresh_token, :string
  end
end
