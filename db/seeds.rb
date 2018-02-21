require 'faker'

# Seed Users
user = {}
user['password'] = 'asdf'


ActiveRecord::Base.transaction do
  20.times do 
    user['name'] = Faker::Name.name 
    user['email'] = Faker::Internet.email
    
    User.create(user)
  end
end 

# Seed Listings
listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  40.times do 
    listing['title'] = Faker::App.name

    listing['property_type'] = ["House", "Entire Floor", "Condominium", "Villa", "Townhouse", "Castle", "Treehouse", "Igloo", "Yurt", "Cave", "Chalet", "Hut", "Tent", "Other"].sample

    listing['living_space'] = ["Entire Place", "Private Room", "Shared Room"].sample

    listing['amenities'] = ["gym", "AC", "washer", "dryer", "wifi"].sample
    
    listing['guests'] = rand(1..10)

    listing['location'] = Faker::Address.city


    listing['price'] = rand(80..500)
    listing['description'] = Faker::Hipster.sentence

    listing['user_id'] = uids.sample

    Listing.create(listing)
  end
end
   