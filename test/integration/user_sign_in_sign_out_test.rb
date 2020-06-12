require 'test_helper'

class UserSignInSignOutTest < ActionDispatch::IntegrationTest
  def setup
  	@user = users(:alfonso)
  	sign_in @user
  end

  test "should allow access to listings form for logged in user" do
  	
  	get new_listing_path
  	assert_response :success
  end

  test "should not allow access to listings form unless logged in" do
  	sign_out @user
  	get new_listing_path
  	assert_redirected_to new_user_registration_path
  end
end
