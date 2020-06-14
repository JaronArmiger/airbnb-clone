require 'test_helper'

class NewListingTest < ActionDispatch::IntegrationTest
  def setup
  	@user = users(:alfonso)
  	sign_in @user
  	@picture = fixture_file_upload('test/fixtures/orangutan.jpg', "image/jpeg")
  end

  test "should require profile picture to access form" do
  	get new_listing_path
  	assert_not @user.profile_picture.attached?
  	assert_redirected_to new_profile_picture_path
  	
  	@user.profile_picture.attach(@picture)
  	assert @user.profile_picture.attached?
  	get new_listing_path
  	assert_response :success
  end

  test "successfully create listing" do
  end

end
