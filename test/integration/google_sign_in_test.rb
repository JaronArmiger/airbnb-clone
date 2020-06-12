require 'test_helper'

class GoogleSignInTest < ActionDispatch::IntegrationTest
  def setup
  	Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
  	Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google]
  end
=begin
  test "successful sign in with google" do
  	p Rails.application.env_config["devise.mapping"]
  	p Rails.application.env_config["omniauth.auth"]

  	assert_difference 'User.count', 1 do
  		get user_google_oauth2_omniauth_callback_path
  	end
  		

  end
=end
end
