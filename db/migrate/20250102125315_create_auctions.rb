class CreateAuctions < ActiveRecord::Migration[8.0]
  def change
    create_table :auctions do |t|
      t.string :name
      t.text :description
      t.date :start_time
      t.date :end_time
      t.string :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
