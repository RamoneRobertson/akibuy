# Clear Database
Bid.destroy_all
Transaction.destroy_all
AuctionItem.destroy_all
Auction.destroy_all
User.destroy_all


# Create Users
users = []
emails = [
  ENV["BUYER1_EMAIL"],
  ENV["BUYER2_EMAIL"],
  ENV["SELLER1_EMAIL"],
  ENV["SELLER2_EMAIL"]
]

emails.each do |email|
  puts "==========================================="
  puts
  puts "Creating new user: #{email}"
  puts
  puts "==========================================="
  user = User.new(email: email, password: ENV["PASSWD"])
  user.save!
  users << user
end

# Assigning Users
buyer1 = users[0]
buyer2 = users[1]
seller1 = users[2]
seller2 = users[3]

# Create Auctions for Sellers
auction1 = Auction.create!(
  name: 'Vintage Furniture and Antiques',
  description: 'Beautiful vintage furniture and collectibles left behind in the akiya.',
  start_time: Date.today,
  end_time: Date.today + 7,
  image: 'https://via.placeholder.com/300x300.png?text=Furniture+Antiques',
  user_id: seller1.id
)

auction2 = Auction.create!(
  name: 'Old Tools and Gardening Equipment',
  description: 'A variety of tools and equipment found in the shed of the akiya.',
  start_time: Date.today,
  end_time: Date.today + 5,
  image: 'https://via.placeholder.com/300x300.png?text=Tools+Equipment',
  user_id: seller2.id
)

puts "Auctions created successfully!"

# Create Auction Items for Auctions
AuctionItem.create!(
  name: 'Vintage Wooden Chair',
  description: 'A sturdy wooden chair with a classic design.',
  start_price: 2000,
  category: 'Furniture',
  image: 'https://via.placeholder.com/150x150.png?text=Wooden+Chair',
  bidding_status: 0,
  auction_id: auction1.id
)

AuctionItem.create!(
  name: 'Porcelain Tea Set',
  description: 'Delicate porcelain tea set with floral patterns.',
  start_price: 3500,
  category: 'Antiques',
  image: 'https://via.placeholder.com/150x150.png?text=Tea+Set',
  bidding_status: 0,
  auction_id: auction1.id
)

AuctionItem.create!(
  name: 'Rustic Gardening Tools',
  description: 'A collection of gardening tools including a rake and pruning shears.',
  start_price: 1500,
  category: 'Tools',
  image: 'https://via.placeholder.com/150x150.png?text=Gardening+Tools',
  bidding_status: 0,
  auction_id: auction2.id
)

AuctionItem.create!(
  name: 'Vintage Toolbox',
  description: 'Metal toolbox filled with old tools.',
  start_price: 2500,
  category: 'Tools',
  image: 'https://via.placeholder.com/150x150.png?text=Toolbox',
  bidding_status: 0,
  auction_id: auction2.id
)

puts "Auction items created successfully!"

# Bids for Buyers
Bid.create!(
  bid_amount: 2200,
  bid_status: 1, # Active bid
  auction_item_id: auction1.id,
  user_id: buyer1.id
)

Bid.create!(
  bid_amount: 1800,
  bid_status: 1, # Active bid
  auction_item_id: auction2.id,
  user_id: buyer2.id
)

puts "Bids created successfully!"
