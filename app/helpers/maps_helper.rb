module MapsHelper
	def map_url
		google_maps_api_key = ENV["GOOGLE_MAPS_API_KEY"]
		root_url = "https://www.google.com/maps/embed/v1/place?"
		address = Location.format_address
	end
end