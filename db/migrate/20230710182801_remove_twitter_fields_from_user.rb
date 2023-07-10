class RemoveTwitterFieldsFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :twitter_username
    remove_column :users, :twitter_name
    remove_column :users, :twitter_id
    remove_column :users, :twitter_profile_image
  end
end
