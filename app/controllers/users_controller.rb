class UsersController < Clearance::UsersController
  
	def show  
		@user = current_user
		@listings = @user.listings
    @my_reservations = current_user.reservations
		# @reservations = @listings.reservations
	end 



end