class Reservation < ApplicationRecord
  belongs_to :listing
  belongs_to :user

  before_save :set_total_price

  # validates_presence_of :check_in, :check_out
  # validate :check_out_is_after_check_in
  # validates :overlap_dates

  # def overlap_dates
  #   if self.listing.reservations.where("(?>= check_in AND ? <= check_out) OR (? >= check_in AND check_out)")
  #     errors.add(:check_in, "overlaps")
  #   end
  # end

  def calculate_date_difference
    (self.check_out - self.check_in).to_i
  end

  def set_total_price
    self.total_price = calculate_date_difference * self.listing.price
  end

  
  

end
