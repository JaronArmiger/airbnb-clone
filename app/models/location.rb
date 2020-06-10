class Location < ApplicationRecord
	# associations
	belongs_to :listing

	# validations
	#validates :postal_code, numericality: true
	# callbacks
	before_save :upcase_country_code

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
		if country_code
			url_string << country_code.upcase + "+"
		end
		if postal_code
			url_string << postal_code.to_s + "+"
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

		def upcase_country_code
			country_code.upcase!
		end
end
