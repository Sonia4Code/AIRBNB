class ReservationsController < ApplicationController


  def index
    @reservations = Reservation.all

    
    # filtering_params(params).each do |key, value|
      
    #    @listings = @listings.public_send(key, value) if value.present?
  end

  def new
    @listing = Listing.find(params[:listing_id])

    @reservation = Reservation.new
    
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @reservation = @listing.reservations.new(reservation_params)
    if @reservation.save
      redirect_to listing_reservation_path(@listing, @reservation)
    end
  end

 def show 
     @listing = Listing.find(params[:listing_id])
     @reservation = Reservation.find(params[:id])
 end

  def edit
     @listing = Listing.find(params[:listing_id])
     @reservation = Reservation.find(params[:id])
  end


  def update
     @listing = Listing.find(params[:listing_id])
     @reservation = Reservation.find(params[:id])
    if @listing.reservation.update(reservation_params)
      redirect_to listing_reservation_path(@listing, @reservation)
    else
      render :edit
    end

    end

  def destroy
      @listing = Listing.find(params[:listing_id])
      @reservation = Reservation.find(params[:id])
      @reservation.destroy
      redirect_to listing_reservations_path
  end

private

  def reservation_params
    params.require(:reservation).permit(:user_id, :listing_id, :total_price, :check_in, 
      :check_out, :guests )
  end

  end 