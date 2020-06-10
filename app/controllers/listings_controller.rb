class ListingsController < ApplicationController
	def index
		@listings = Listing.all
	end

	def show
		@listing = Listing.find(params[:id])
		@location = @listing.location
	end

	def new
		session[:listing_params] ||= {}
		@listing = Listing.new(session[:listing_params])
		@listing.current_step = session[:listing_step]
	end

	def create
		session[:listing_params].deep_merge!(listing_params) if params[:listing]
		@listing = Listing.new(session[:listing_params])
		
		@listing.current_step = session[:listing_step]

		puts "@listing"
		p @listing
=begin
		puts ""
		puts "session[:listing_params]"
		p session[:listing_params]
		puts "@listing.current_step"
		p @listing.current_step
		puts "session[:listing_step]"
		p session[:listing_step]
		puts ""
=end	
		if @listing.valid?
			if params[:back_button]
				@listing.previous_step
			elsif @listing.last_step?
				@listing.save if @listing.all_valid?
			else
				@listing.next_step
			end
			session[:listing_step] = @listing.current_step
		end
		if @listing.new_record? # returns true if object has not been saved yet
			render :new
		else
			session[:listing_step] = session[:listing_params] = nil
			flash[:notice] = "Listing Saved"
			redirect_to listing_path(@listing)
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
