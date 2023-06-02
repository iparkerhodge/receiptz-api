class AddTwitterProfileImageToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :twitter_profile_image, :string
  end
end
