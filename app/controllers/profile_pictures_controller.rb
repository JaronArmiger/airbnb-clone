class ProfilePicturesController < ApplicationController
	def new
	end

	def create
		current_user.profile_picture.attach(params[:profile_picture])
		flash[:notice] = "Profile Picture added!"
		redirect_back_or user_path(current_user)
	end
end
