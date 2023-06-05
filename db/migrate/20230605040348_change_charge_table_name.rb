class ChangeChargeTableName < ActiveRecord::Migration[7.0]
  def change
    rename_table :charges, :receipts
  end
end
