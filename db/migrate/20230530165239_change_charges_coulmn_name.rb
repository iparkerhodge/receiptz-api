class ChangeChargesCoulmnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :charges, :charges, :counts
  end
end