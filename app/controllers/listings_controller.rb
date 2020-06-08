class ListingsController < ApplicationController
	def index
		@listings = Listing.all
	end

	def show
		@listing = Listing.find(params[:id])
		@location = @listing.location
	end

	def new
		@listing = Listing.new
		@listing.build_location
	end

	def create
		@listing = Listing.new(listing_params)
		if @listing.save
			redirect_to listing_path(@listing)
		else
			render :new
		end
	end

	private
		def listing_params
			params.require(:listing).permit(:type_id,
											:guests, :beds,
											:bathrooms, :amenity_ids,
											:space_ids, :description,
											:title, location_attributes:
											[ :country_code, :street_address,
											 :city, :state, :postal_code ] )
		end
end
