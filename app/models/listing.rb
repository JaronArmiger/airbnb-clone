class Listing < ApplicationRecord
	
	# associations
	has_one :location, dependent: :destroy
	accepts_nested_attributes_for :location
	has_and_belongs_to_many :spaces
	has_and_belongs_to_many :amenities
	belongs_to :type

	# validations
	validates :type_id, presence: true
	validates :guests, presence: true, numericality: { only_integer: true }
	validates :beds, presence: true, numericality: { only_integer: true }
	validates :bathrooms, presence: true, numericality: { only_integer: true }
	validates :description, presence: true, length: { maximum: 500 }
	validates :title, presence: true, length: { maximum: 30 }
end
