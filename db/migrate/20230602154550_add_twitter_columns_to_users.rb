class AddTwitterColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column(:users, :twitter_username, :string, null: false)
    add_column(:users, :twitter_name, :string)
    add_column(:users, :twitter_id, :string)
  end
end
