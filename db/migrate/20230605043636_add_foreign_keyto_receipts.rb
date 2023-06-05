class AddForeignKeytoReceipts < ActiveRecord::Migration[7.0]
  def change
    add_column :receipts, :user_id, :integer, index: true
    add_foreign_key :receipts, :users
  end
end
