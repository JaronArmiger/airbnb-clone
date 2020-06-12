class LocationsController < ApplicationController
	before_action :require_sign_up
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
