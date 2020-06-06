module MapsHelper
	def map_url
		google_maps_api_key = ENV["GOOGLE_MAPS_API_KEY"]
		root_url = "https://www.google.com/maps/embed/v1/place?"
		address = Location.format_address
		"https://www.google.com/maps/embed/v1/place?q=Space+Needle,Seattle,WA&key=AIzaSyAtFDDw9qIGIr5XVbQSCJ_nrPd-CxI3e-A"
	end
end