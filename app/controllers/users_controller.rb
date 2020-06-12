class UsersController < ApplicationController
	before_action :require_log_in

	def show
		@user = User.find(params[:id])
	end
end
