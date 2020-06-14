# Type
	type_names = ["apartment", "house", "secondary unit", 
				  "unique space", "bed and breakfast", "boutique hotel"]
	type_names.each do |name|
		Type.create(name: name)
	end

# Space
	space_names = ["kitchen", "laundry-washer", "laundry-dryer",
				   "parking", "gym", "pool", "hot tub"]
	space_names.each do |name|
		Space.create(name: name)
	end

# Amenity
	amenity_names = ["essentials", "wifi", "TV", "heat",
					 "air conditioning", "iron", "shampoo",
					 "hair dryer", "fireplace"]
	amenity_names.each do |name|
		Amenity.create(name: name)
	end	

# Listings
	100.times do
		amount = rand(5) + 1
		description = Faker::Hipster.paragraph
		title = Faker::Hipster.sentence
		type_id = rand(5) + 1
		Listing.create(description: description, title: title,
					   bathrooms: amount, beds: amount, 
					   guests: amount, type_id: type_id)
	end



# Locations
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

	addresses.each_with_index do |address, i|
		Location.create(country_code: address.country_code,
						 country: address.country,
						 state: address.state,
						 city: address.city,
						 postal_code: address.postal_code,
						 street_address: address.street,
						 listing_id: i+1
			)
	end

