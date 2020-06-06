require 'test_helper'

class LocationControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get location_new_url
    assert_response :success
  end

  test "should get create" do
    get location_create_url
    assert_response :success
  end

end
