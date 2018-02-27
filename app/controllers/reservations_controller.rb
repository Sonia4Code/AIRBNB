class ReservationsController < ApplicationController


  def index
        # @reservation.user_id = current_user.id
        @listings = current_user.listings
      

  end

  def user_index
    @reservation = current_user.reservations
  end

  def new
    @listing = Listing.find(params[:listing_id])

    @reservation = Reservation.new
    
  end

  def create
    @listing = Listing.find(params[:listing_id])
      @reservation = @listing.reservations.new(reservation_params)#.merge(user_id: current_user.id)
      @reservation.user_id = current_user.id
    if @reservation.save
      redirect_to listing_reservation_path(@listing, @reservation)
      host = User.find(@listing.user_id)      
      # ReservationJob.perform_later(current_user, host, @reservation_id)
      ReservationMailer.booking_email(current_user, host, @reservation.id).deliver_later
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
     @reservation = Reservation.find(params[:id])
     @listing = @reservation.listing
    if @reservation.update(reservation_params)
      redirect_to listing_reservation_path(@listing, @reservation)
    else
      render :edit
    end
  end

  def destroy
      @reservation = Reservation.find(params[:id])
      @reservation.destroy

      redirect_to listing_reservations_path
  end

private

  def reservation_params
    params.require(:reservation).permit(:id, :user_id, :listing_id, :total_price, :check_in, 
      :check_out, :guests )
  end

  end 