class CreateCharges < ActiveRecord::Migration[7.0]
  def change
    create_table :charges do |t|
      t.string :title, null: false
      t.string :accusee
      t.date :collection_date
      t.text :charges, array: true, default: []
      t.string :image_url

      t.timestamps
    end
  end
end
