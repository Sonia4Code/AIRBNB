class UsersController < Clearance::UsersController
  
	def show  
		@listings = current_user.listings

    @my_reservations = current_user.reservations
		# @reservations = @listings.reservations
	end 



end