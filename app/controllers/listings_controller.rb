class ListingsController < ApplicationController
	before_action :require_sign_up
	before_action :require_profile_picture
	
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
		if session[:listing_params]["location_attributes"]
			@location = @listing.build_location(session[:listing_params]["location_attributes"])
		end
		if ( space_ids = session[:listing_params]["space_ids"] )
			@spaces = Space.find(space_ids[1..-1])
		end
		if ( amenity_ids = session[:listing_params]["amenity_ids"] )
			@amenities = Amenity.find(amenity_ids[1..-1])
		end
	end

	def create
		session[:listing_params].deep_merge!(listing_params) if params[:listing]
		@listing = Listing.new(session[:listing_params])
		
		@listing.current_step = session[:listing_step]

		if @listing.valid?
			if params[:back_button]
				@listing.previous_step
			elsif params[:review]
				@listing.next_step
				if session[:listing_params]["location_attributes"]
					@location = @listing.build_location(session[:listing_params]["location_attributes"])
				end
				if ( space_ids = session[:listing_params]["space_ids"] )
					@spaces = Space.find(space_ids[1..-1])
				end
				if ( amenity_ids = session[:listing_params]["amenity_ids"] )
					@amenities = Amenity.find(amenity_ids[1..-1])
				end
			elsif @listing.last_step?
				@listing.save if @listing.all_valid?
			else
				@listing.next_step
			end
			
			session[:listing_step] = @listing.current_step
		end

		puts "session[:listing_params]"
		p session[:listing_params]

		puts "space_ids"
		p space_ids

		puts "session[:listing_params]['space_ids']"
		p session[:listing_params]["space_ids"]
		puts "@spaces"
		p @spaces

		puts "@amenities"
		p @amenities
=begin
		puts "@listing"
		p @listing

		puts "@location"
		p @location

		puts ""
		
		#puts "session[:listing_params][:location_attributes]"
		#p session[:listing_params]["location_attributes"]
		puts "@listing.current_step"
		p @listing.current_step
		puts "session[:listing_step]"
		p session[:listing_step]
		puts "yes we have location_attributes"
		puts ""
=end
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
											:bathrooms, :description,
											:title, location_attributes:
											[ :country_code, :street_address,
											 :city, :state, :postal_code ], 
											 :amenity_ids => [],
											 :space_ids => [] )
		end

		def require_profile_picture
			unless current_user.profile_picture.attached?
				store_location
				redirect_to profile_picture_path
			end
		end
end
