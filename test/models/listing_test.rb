require 'test_helper'

class ListingTest < ActiveSupport::TestCase
  def setup
  	@listing = listings(:one)
  end

  test "should be valid" do
  	assert @listing.valid?
  end

  test "type id should be present" do
  	@listing.type_id = nil
  	assert_not @listing.valid?
  end

  test "guests should be present" do
  	@listing.guests = nil
  	assert_not @listing.valid?
  end

  test "guests should be a number" do
  	@listing.guests = "a"
  	assert_not @listing.valid?
  end

  test "beds should be present" do
  	@listing.beds = nil
  	assert_not @listing.valid?
  end

  test "beds should be a number" do
  	@listing.beds = "a"
  	assert_not @listing.valid?
  end

  test "bathrooms should be present" do
  	@listing.bathrooms = nil
  	assert_not @listing.valid?
  end

  test "bathrooms should be a number" do
  	@listing.bathrooms = "@listing.bathrooms.to_s"
  	assert_not @listing.valid?
  end

  test "description should be present" do
  	@listing.description = nil
  	assert_not @listing.valid?
  end

  test "description should be <= 500 characters" do
  	@listing.description = "q" * 501
  	assert_not @listing.valid?
  end

  test "title should be present" do
  	@listing.title = nil
  	assert_not @listing.valid?
  end

  test "title should be <= 30 characters" do
  	@listing.title = "q" * 31
  	assert_not @listing.valid?
  end
end
