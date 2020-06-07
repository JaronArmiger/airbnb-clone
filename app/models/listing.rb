class Listing < ApplicationRecord
	has_one :location, dependent: :destroy
	has_and_belongs_to_many :spaces
	has_and_belongs_to_many :amenities
	belongs_to :type
end
