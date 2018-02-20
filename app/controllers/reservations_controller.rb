class ReservationsController < ApplicationController

  def new
    @listings = Listing.find(params[:format])
  end

  def index
    @reservations = Reservation.all
    # filtering_params(params).each do |key, value|
      
    #    @reservations = @reservations.public_send(key, value) if value.present?
      
       
  end

    def show
    end


end
