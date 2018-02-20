class ReservationsController < ApplicationController

  def new
    @listings = Listing.find(params[:format])

    @reservation = Reservation.new
  end

  def index
    @reservations = Reservation.all
    # filtering_params(params).each do |key, value|
      
    #    @reservations = @reservations.public_send(key, value) if value.present?
  end

    def show
      
      @reservations = Reservation.find(params[:id])
    end

  def create
    @reservations = Reservation.new(reservation_params)
      if @reservations.save
        redirect_to @reservations
      end
  end

  def edit
    id = params[:id]
      @reservations = Reservation.find(id)
  end


  def update
    @reservations = Reservation.find(params[:id])
    if @reservations.update(reservation_params)
      redirect_to reservation_path
    else
      render :edit
    end

    end

  def destroy
      id = params[:id]
      @reservations = Reservations.find(id)
      @reservations.destroy
      redirect_to "/reservations"
  end

private

  def reservation_params
    params.require(:reservation).permit(:user_id, :guest_id, :total_price, :check_in, 
      :check_out, :guests )
  end

  end 