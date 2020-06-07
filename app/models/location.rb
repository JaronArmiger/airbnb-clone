class Location < ApplicationRecord
	belongs_to :listing

	def format_address
		url_string = ""
		if street_number
			url_string << street_number + "+"
		end
		if street
			url_string << street + "+"
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
end
