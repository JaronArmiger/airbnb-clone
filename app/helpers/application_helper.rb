module ApplicationHelper
	def require_sign_up
		unless user_signed_in?
			flash[:alert] = "You must be signed in!"
			redirect_to new_user_registration_path
		end
	end
end
