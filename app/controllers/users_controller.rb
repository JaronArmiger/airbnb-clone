class UsersController < ApplicationController
	before_action :require_sign_up

	def show
		@user = User.find(params[:id])
	end
end
