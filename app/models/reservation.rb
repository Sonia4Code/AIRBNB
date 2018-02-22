class Reservation < ApplicationRecord
  belongs_to :listing
  belongs_to :user

  before_save :set_total_price

  def calculate_date_difference
    (self.check_out - self.check_in).to_i
  end

  def set_total_price
    self.total_price = calculate_date_difference * self.listing.price
  end

  
  

end
