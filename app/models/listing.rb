class Listing < ApplicationRecord
   has_one :user
   has_many :reservations
   has_many :photos

   paginates_per 9
   
   # scope :created_at, -> (created_at) { where created_at: guests}

   
   scope :country, -> (country) { where("country ILIKE ?", "%#{country}%") }
   scope :location, -> (location) { where("location ILIKE ?", "%#{location}%") }   
   scope :property_type, -> (property_type) { where property_type: property_type}
   scope :bathrooms, -> (bathrooms) { where bathrooms: bathrooms}
   scope :bedrooms, -> (bedrooms) { where bedrooms: bedrooms}



   # def self.bedroom(aaa)
   #    where(bedroom: aaa)
   # end 
   # scope :minimum, -> (price) { where("price <= ?", "%#{price}%")}
   # def self.minimum(price)
   #    where(price: price < min)
   # end 

   # scope :haha, 

   # scope :maximum, -> (price) { where("price => ?", "%#{price}%")}
   
   

   

   # Images
   mount_uploaders :avatars, AvatarUploader
   serialize :avatars, JSON

end

