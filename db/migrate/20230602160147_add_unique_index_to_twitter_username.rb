class AddUniqueIndexToTwitterUsername < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :twitter_username, unique: true
  end
end
