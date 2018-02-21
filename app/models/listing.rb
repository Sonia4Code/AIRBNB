class Listing < ApplicationRecord
   has_one :user
   has_many :reservations

   
   
   scope :guests, -> (guests) { where guests: guests}
   
   scope :property_type, -> (property_type) { where property_type: property_type}

   scope :location, -> (location) { where("location ILIKE ?", "%#{location}%") }
	
end

