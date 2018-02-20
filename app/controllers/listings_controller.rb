class ListingsController < ApplicationController


	def index
		@listings = Listing.all
		filtering_params(params).each do |key, value|
			
		   @listings = @listings.public_send(key, value) if value.present?
		  
      	end
	end

 	
 	def create
 		@listings = Listing.new(listing_params)
 			if @listings.save
 				redirect_to @listings
 			end
 	end

 	def new 
 		@listing = Listing.new
 		render template: "listings/new"

 	end 

 	def show
 		id = params[:id]
 		@listings = Listing.find(params[:id])


 	end

 	def edit
 		id = params[:id]
	    @listings = Listing.find(id)
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
  	
  	def search
	  #store all the listings that match the location searched
	  @listings = Listing.where("location LIKE ? ", "%#{params[:location]}%")  

	   render template:"listings/search"

	end


	private

	def listing_params
 		params.require(:listing).permit(:id, :location, :property_type, :price, 
 			:title, :description, :guests, :living_space, amenities: [])
 	end

 	def filtering_params(params)
 		params.slice(:guests, :location, :property_type)
 	end

end
