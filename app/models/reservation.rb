class Reservation < ApplicationRecord
  belongs_to :listing
  belongs_to :user
  before_save :set_total_price

     #  validates_presence_of :check_in, :check_out

  #  validate :check_out_is_after_check_in

  #  validate :overlap_dates

  #  validate :check_in_after_today

  #  def overlap_dates
  #      if self.listing.reservations.where("(? >= check_in AND ? < check_out) OR (? > check_in AND ? <= check_out)", self.check_in, self.check_in, self.check_out, self.check_out).count != 0
  #      errors.add(:check_in, " overlaps")
  #      end
  #  end
  
  # def check_in_after_today
  #      errors.add(:check_in, "before today") if self.check_in < Date.today
  #  end

  def calculate_date_difference
    (self.check_out - self.check_in).to_i
  end

  def set_total_price
    self.total_price = calculate_date_difference * self.listing.price
  end


  # private

  # def check_out_is_after_check_in
  #      return if check_out.blank? || check_in.blank?
  #      if check_out <= check_in
  #          errors.add(:check_in, "Cannot be before check_in")
  #      end
  #  end
  end
  
  


