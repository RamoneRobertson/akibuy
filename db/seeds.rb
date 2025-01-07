# Clear Database
Purchase.destroy_all
Comment.destroy_all
Product.destroy_all
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

# Create products
products = [
  {
    name: "Vintage Kokeshi Doll Set",
    image: "kokeshi_dolls.jpg",
    categories: "Collectibles",
    condition: "Good",
    description: "A set of hand-painted traditional Kokeshi dolls, originating from the Tohoku region.",
    shipping_method: "Standard Shipping",
    region_of_origin: "Miyagi Prefecture",
    sales_price: 4500.0,
    delivery_time: DateTime.now + 7.days,
    user_id: users.sample.id
  },
  {
    name: "Antique Tea Set",
    image: "antique_tea_set.jpg",
    categories: "Kitchenware",
    condition: "Fair",
    description: "A porcelain tea set featuring intricate sakura patterns. Some minor chips on a few cups.",
    shipping_method: "Express Shipping",
    region_of_origin: "Kyoto",
    sales_price: 12000.0,
    delivery_time: DateTime.now + 5.days,
    user_id: users.sample.id
  },
  {
    name: "Hand-Carved Wooden Daruma",
    image: "wooden_daruma.jpg",
    categories: "Decor",
    condition: "Excellent",
    description: "A rare hand-carved wooden Daruma with vibrant red paint. Represents perseverance and good luck.",
    shipping_method: "Standard Shipping",
    region_of_origin: "Nagano Prefecture",
    sales_price: 8000.0,
    delivery_time: DateTime.now + 6.days,
    user_id: users.sample.id
  },
  {
    name: "Worn Tatami Mats",
    image: "tatami_mats.jpg",
    categories: "Home Improvement",
    condition: "Poor",
    description: "A set of 4 tatami mats, showing signs of wear but still functional for restoration or repurposing.",
    shipping_method: "Local Pickup Only",
    region_of_origin: "Shizuoka",
    sales_price: 300.0,
    delivery_time: DateTime.now + 10.days,
    user_id: users.sample.id
  },
  {
    name: "Vintage Kimono",
    image: "vintage_kimono.jpg",
    categories: "Clothing",
    condition: "Good",
    description: "A silk kimono with a detailed crane motif. Perfect for collectors or as a unique wardrobe piece.",
    shipping_method: "Express Shipping",
    region_of_origin: "Kanazawa",
    sales_price: 15000.0,
    delivery_time: DateTime.now + 3.days,
    user_id: users.sample.id
  },
  {
    name: "Old Shoji Screen",
    image: "shoji_screen.jpg",
    categories: "Furniture",
    condition: "Fair",
    description: "A traditional wooden Shoji screen with torn rice paper. Great for restoration or decoration.",
    shipping_method: "Standard Shipping",
    region_of_origin: "Hokkaido",
    sales_price: 5500.0,
    delivery_time: DateTime.now + 7.days,
    user_id: users.sample.id
  },
  {
    name: "Rustic Cast Iron Kettle",
    image: "cast_iron_kettle.jpg",
    categories: "Kitchenware",
    condition: "Good",
    description: "An authentic cast iron kettle (Tetsubin) used for brewing tea. Some rust on the exterior adds to its charm.",
    shipping_method: "Standard Shipping",
    region_of_origin: "Iwate Prefecture",
    sales_price: 9000.0,
    delivery_time: DateTime.now + 4.days,
    user_id: users.sample.id
  },
  {
    name: "Bamboo Basket Collection",
    image: "bamboo_baskets.jpg",
    categories: "Decor",
    condition: "Good",
    description: "A collection of handwoven bamboo baskets, suitable for decoration or functional use.",
    shipping_method: "Standard Shipping",
    region_of_origin: "Gifu Prefecture",
    sales_price: 3500.0,
    delivery_time: DateTime.now + 5.days,
    user_id: users.sample.id
  },
  {
    name: "Antique Wooden Chest (Tansu)",
    image: "wooden_chest.jpg",
    categories: "Furniture",
    condition: "Excellent",
    description: "A traditional Japanese wooden chest (Tansu) with iron fittings. Well-preserved and highly functional.",
    shipping_method: "Freight Shipping",
    region_of_origin: "Osaka",
    sales_price: 25000.0,
    delivery_time: DateTime.now + 14.days,
    user_id: users.sample.id
  },
  {
    name: "Old Ceramic Tiles",
    image: "ceramic_tiles.jpg",
    categories: "Building Materials",
    condition: "Fair",
    description: "A set of hand-painted ceramic tiles salvaged from the kitchen of an old Akiya. Great for DIY projects.",
    shipping_method: "Local Pickup Only",
    region_of_origin: "Okayama",
    sales_price: 1000.0,
    delivery_time: DateTime.now + 7.days,
    user_id: users.sample.id
  }
]

products.each do |product|
  Product.create!(product)
end
