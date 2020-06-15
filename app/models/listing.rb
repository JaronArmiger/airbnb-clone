class Listing < ApplicationRecord
	has_many_attached :images

	# associations
	belongs_to :host, class_name: "User"
	has_one :location, dependent: :destroy
	accepts_nested_attributes_for :location
	has_and_belongs_to_many :spaces
	has_and_belongs_to_many :amenities
	belongs_to :type

	# validations
	validates :type_id, presence: true, if: lambda { |l| l.current_step == "type"}
	validates :guests, presence: true, numericality: { only_integer: true }, if: lambda { |l| l.current_step == "guests_beds"}
	validates :beds, presence: true, numericality: { only_integer: true }, if: lambda { |l| l.current_step == "guests_beds"}
	validates :bathrooms, presence: true, numericality: { only_integer: true }, if: lambda { |l| l.current_step == "bathrooms"}
	validates :description, presence: true, length: { maximum: 500 }, if: lambda { |l| l.current_step == "description"}
	validates :title, presence: true, length: { maximum: 30 }, if: lambda { |l| l.current_step == "title" }

	attr_writer :current_step

	# reader method
	def current_step
		# what's specified by writer, or default to first step in list
		@current_step || steps.first
	end

	def steps
		%w[type guests_beds bathrooms location amenities spaces description title confirmation images]
	end

	def next_step
		self.current_step = steps[steps.index(current_step) + 1]
	end

	def previous_step
		self.current_step = steps[steps.index(current_step) - 1]
	end

	def first_step?
		current_step == steps.first
	end

	def last_step?
		current_step == steps.last
	end

	def all_valid?
		steps.all? do |step|
			self.current_step = step
			valid?
		end
	end

	def listing_images
		@listing_images ||= images
	end
end
