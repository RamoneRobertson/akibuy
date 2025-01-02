class CreateBids < ActiveRecord::Migration[8.0]
  def change
    create_table :bids do |t|
      t.integer :bid_amount
      t.integer :bid_status
      t.references :auction, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
