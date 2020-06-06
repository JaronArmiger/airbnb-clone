class LocationsController < ApplicationController
	
	def index
		@locations = Location.all
	end

	def show
		@location = Location.find(params[:id])
	end

	def new
		@location = Location.new
	end

	

	def create
	end
end
