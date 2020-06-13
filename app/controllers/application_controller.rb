class ApplicationController < ActionController::Base
	include ApplicationHelper

	before_action :store_user_location!, if: :storable_location?
	before_action :configure_permitted_parameters, if: :devise_controller?

	private

		def configure_permitted_parameters
			update_attrs = [:name, :email, :password, :password_confirmation, :current_password, :profile_picture]
			devise_parameter_sanitizer.permit(:sign_up, keys: update_attrs)
			devise_parameter_sanitizer.permit(:account_update, keys: update_attrs)
		end

		def storable_location?
			request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
		end

		def store_user_location!
			store_location_for(:user, request.fullpath)
		end

		def after_sign_in_path_for(resource_or_scope)
			stored_location_for(resource_or_scope) || super
		end
end
