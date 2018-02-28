class Listing < ApplicationRecord
   has_one :user
   has_many :reservations
   has_many :photos

   paginates_per 8
   
   # scope :created_at, -> (created_at) { where created_at: guests}

   
   scope :country, -> (country) { where("country ILIKE ?", "%#{country}%") }
   scope :location, -> (location) { where("location ILIKE ?", "%#{location}%") }   
   scope :property_type, -> (property_type) { where property_type: property_type}
   scope :bathrooms, -> (bathrooms) { where bathrooms: bathrooms}
   scope :bedrooms, -> (bedrooms) { where bedrooms: bedrooms}

   # scope :price, -> (price) { where ("price <= ?", "%#{price}%")}
   
   

   

   # Images
   mount_uploaders :avatars, AvatarUploader
   serialize :avatars, JSON

end

