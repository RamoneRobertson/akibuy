class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :image
      t.string :categories
      t.string :condition
      t.text :description
      t.string :shipping_method
      t.string :region_of_origin
      t.decimal :sales_price
      t.datetime :delivery_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
