class Reservation < ApplicationRecord
  belongs_to :listing

  has_one :user

end
