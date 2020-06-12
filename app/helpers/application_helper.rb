module ApplicationHelper
	def require_sign_up
		unless user_signed_in?
			flash[:alert] = "You must be signed in!"
			redirect_to new_user_registration_path
		end
	end

	def redirect_back_or(default)
		redirect_to(session[:forwarding_url] || default)
		session.delete(:forwarding_url)
	end

	def store_location
		session[:forwarding_url] = request.original_url if request.get?
	end
end
