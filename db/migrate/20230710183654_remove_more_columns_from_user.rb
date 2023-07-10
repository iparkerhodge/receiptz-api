class RemoveMoreColumnsFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :access_token
    remove_column :users, :access_token_issued_at
    remove_column :users, :refresh_token
    remove_column :users, :encrypted_password
    remove_column :users, :reset_password_token
    remove_column :users, :reset_password_sent_at
    remove_column :users, :remember_created_at

    add_column :users, :password_digest, :string
  end
end
