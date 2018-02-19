class ListingsController < ApplicationController
	def index
		@listings = Listing.all
	end

 	
 	def create
 		@listings = Listing.new(listing_params)
 			if @listings.save
 				redirect_to @listings
 			else
 			render 
 			end
 	end

 	def show
 		@listings = Listing.find(params[:id])
 	end

 	def edit
 		# id = params[:id]
	  #   @listings = Listing.find(id)
 	end

def update
    @listings = Listing.find(params[:id])
    if @listings.update(listing_params)
      redirect_to listings_path
    else
      render :edit
    end

    end

 	def destroy
	    id = params[:id]
	    @listings = Listing.find(id)
	    @listings.destroy
	    redirect_to "/listings"
	end

	def listing_params
 		params.require(:listing).permit(:id, :location, :property_type, :price)
 	end

end
