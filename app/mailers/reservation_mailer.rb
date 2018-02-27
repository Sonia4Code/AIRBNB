require 'mail'

class ReservationMailer < ApplicationMailer
  default from: "sonia4code@gmail.com"

  def booking_email(customer, host, reservation_id)
    byebug 
      @customer = customer
      @host = host 
      @reservation_id = reservation_id 
      # @url = user_path(customer.id)

      mail(to: @customer.email, subject: 'Welcome to My Awesome Site')
  end

end
