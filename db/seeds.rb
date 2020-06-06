addresses = []

until addresses.length == 100
	lat = Faker::Address.latitude
	long = Faker::Address.longitude
	coordinates = [lat,long]
	results = Geocoder.search(coordinates)
	if results.first.address
		addresses << results.first
	end
end

addresses.each do |address|
	Location.create!(country_code: address.country_code,
					 state: address.state,
					 city: address.city,
					 postal_code: address.postal_code,
					 street: address.street
		)
end

