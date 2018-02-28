class Listing < ApplicationRecord
   has_one :user
   has_many :reservations
   has_many :photos

   paginates_per 8
   
   scope :created_at, -> (created_at) { where created_at: guests}

   scope :guests, -> (guests) { where guests: guests}
   
   scope :property_type, -> (property_type) { where property_type: property_type}

   scope :location, -> (location) { where("location ILIKE ?", "%#{location}%") }

   # Images
   mount_uploaders :avatars, AvatarUploader
   serialize :avatars, JSON

end

