class CreateAuctionItems < ActiveRecord::Migration[8.0]
  def change
    create_table :auction_items do |t|
      t.string :name
      t.text :description
      t.integer :start_price
      t.string :category
      t.string :image
      t.integer :bidding_status
      t.references :auction, null: false, foreign_key: true

      t.timestamps
    end
  end
end
