class AddItemIdToBids < ActiveRecord::Migration[8.0]
  def change
    add_reference :bids, :item, null: false, foreign_key: true
  end
end
