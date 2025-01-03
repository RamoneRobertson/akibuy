class RemoveAuctionIdFromBids < ActiveRecord::Migration[8.0]
  def change
    remove_column :bids, :auction_id, :integer
  end
end
