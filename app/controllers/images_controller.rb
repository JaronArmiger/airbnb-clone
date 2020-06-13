class ImagesController < ApplicationController
	def new
		@id = params[:id]
	end

	def create
		@listing = Listing.find(params[:id])
		@listing.images.attach(params[:images])
		redirect_to @listing
	end
end
