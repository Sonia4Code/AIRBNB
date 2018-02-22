class ListingsController < ApplicationController

  
	def index
		@listings = Listing.all
  		filtering_params(params).each do |key, value|
  	  @listings = @listings.public_send(key, value) if value.present?
  	end
    @listings = Listing.page(params[:page])  
      
	end

 	
 	def create
 		@listing = Listing.new(listing_params)
 			if @listing.save
        flash[:notice] = "You have successfully created a listing!"
 				redirect_to @listing
   
      else
        flash[:notice] = "You have failed to created a listing!"
        redirect_to new_listing_path(@listing)
 			end
 	end

 	def new 
 		@listing = Listing.new
 		render template: "listings/new"

 	end 

  	def show
 		id = params[:id]
 		@listing = Listing.find(params[:id])
 	end

 	def edit
 		id = params[:id]
	    @listing = Listing.find(id)
 	end

def update
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      redirect_to @listing
    else
      render :edit
    end
end

  	def destroy
	    id = params[:id]
	    @listing = Listing.find(params[:id])
	    @listing.destroy
     redirect_to "/listings"
	 end
  	
  	def search
	  
	  @listing = Listing.where("location LIKE ? ", "%#{params[:location]}%")  

	   render template:"listings/search"
	end


	private

  # def set_listing
  # end

	def listing_params
 		params.require(:listing).permit(:id, :role, :location, :property_type, :price, 
 			:title, :description, :guests, :living_space, :page, :avatar,  amenities: [])
 	end

 	def filtering_params(params)
 		params.slice(:guests, :location, :property_type, :created_at)
 	end

end


 



  # def verify
 #      @user = user.find(params[:id])
 # #      # authorization code
 #      if user.role == "customer" || "superadmin"
 #        flash[:notice] = "Sorry. You are not allowed to perform this action."
 #        return redirect_to some_other_url, notice: "Sorry. You do not have the permissino to verify a property."
 #      end
 #    end
