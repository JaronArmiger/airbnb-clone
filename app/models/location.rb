class Location < ApplicationRecord
	# associations
	belongs_to :listing

	# validations
	#validates :postal_code, numericality: true
	# callbacks
	after_create :input_country, :create_loc_string
	after_update :input_country, :create_loc_string

	def self.matching_ids(string)
		locs = Location.where("loc_string LIKE ?", "%#{string}%")
		ids = locs.pluck(:listing_id)
	end

	def format_address
		url_string = ""
		if street_address
			url_string << street_address + "+"
		end
		if city
			url_string << city + "+"
		end
		if state
			url_string << state + "+"
		end
		if country
			url_string << country + "+"
		end
		url_string.gsub!(" ", "+")
		url_string = url_string.chop
		if url_string.length == 2
			url_string = country
		end
		url_string
	end

	def map_url
		key = ENV["GOOGLE_MAPS_API_KEY"]
		root_url = "https://www.google.com/maps/embed/v1/place?"
		address = format_address
		url = root_url + "q=" + address + "&key=" + key
	end

	private

		def create_loc_string
			location_string = self.format_address.downcase
			update_column(:loc_string, location_string)
		end

		def input_country
			if country.nil? && country_code
				code = IsoCountryCodes.find(country_code.downcase)
				self.country = code.name
				self.save!
			end
		end
end
