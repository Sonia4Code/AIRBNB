class UsersController < Clearance::UsersController
  
	def show  
		@listings = current_user.listings

    @my_reservations = current_user.reservations
		# @reservations = @listings.reservations
	end 


  private 
  def user_params
    params.require(:user).permit(:name, :password, :email)
  end

end