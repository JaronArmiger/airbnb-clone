module ApplicationHelper
	def require_log_in
		unless user_signed_in?
			flash[:alert] = "You must be signed in!"
			redirect_to new_user_session_path
		end
	end
end
