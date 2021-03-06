class ListingsController < ApplicationController
	before_action :require_sign_up
	before_action :require_profile_picture, except: [:index, :show]
	
	def index
		if params[:search]
			@search_params = params[:search][:location]
			ids = Location.matching_ids(params[:search][:location])
			@listings = Listing.find(ids)
		end
	end

	def show
		@listing = Listing.find(params[:id])
		@location = @listing.location
	end

	def new
		session[:listing_params] ||= {}
		@listing = current_user.listings.build(session[:listing_params])
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

		@listing = current_user.listings.build(session[:listing_params])

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
			elsif @listing.current_step == "confirmation"
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
			redirect_to controller: 'images', action: 'new', id: @listing.id
			#redirect_to listing_path(@listing)
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
											 :space_ids => [],
											 :images => [] )
		end

		def search_params
			#params.require(:search).permit(:)
		end

		def require_profile_picture
			unless current_user.profile_picture.attached?
				store_location
				flash[:notice] = "Finish setting up your account"
				redirect_to new_profile_picture_path
			end
		end
end
