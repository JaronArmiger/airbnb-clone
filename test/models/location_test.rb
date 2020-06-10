require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  def setup
  	@location = locations(:one)
  end

  test "should be valid" do
  	assert @location.valid?
  end
=begin
  test "postal code should be number" do
  	@location.postal_code = "sccoby doo"
  	assert_not @location.valid?
  end
=end
end
