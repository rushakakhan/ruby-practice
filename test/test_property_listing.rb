require 'minitest/autorun'

require_relative '../Assignments/ForTheOop/user.rb'
require_relative '../Assignments/ForTheOop/property_owner.rb'
require_relative '../Assignments/ForTheOop/property.rb'
require_relative '../Assignments/ForTheOop/property_listing.rb'

class TestPropertyListing < Minitest::Test
  
  def setup
    @owner = PropertyOwner.new("Craig Rushon")
    @user = User.new("Brett Davidson")
    @listing = PropertyListing.new("56 White Oak Drive, Ottawa, ON", "Brett Davidson", 2550.60, "Jimmy Salesman", 249900)
  end

  def test_the_listing_has_no_bids_yet
    assert(@listing.bids.empty?)
  end

  def test_the_bid_was_added_to_listing
    @listing.add_bid("Craig Rushon", 255000)

    actual = @listing.bids.first
    expected = { name: "Craig Rushon", amount: 255000 }

    assert_equal(expected, actual)
  end

  def test_get_bid_works
    @listing.add_bid("Craig Rushon", 255000)
    @listing.add_bid("Jim Morrison", 252500)

    actual = @listing.get_bid(1)
    expected = { name: "Jim Morrison", amount: 252500 }

    assert_equal(expected, actual)
  end

  def test_highest_bid_works
    @listing.add_bid("Jim Morrison", 252500)
    @listing.add_bid("Sandi Metz", 266500)

    actual = @listing.get_highest_bid
    expected = {name: "Sandi Metz", amount: 266500}

    assert_equal(expected, actual)
  end

  def test_to_s_method
    actual = @listing.to_s
    expected = "Address: 56 White Oak Drive, Ottawa, ON\nListing Agent: Jimmy Salesman\nAsking price: $249900\nStatus: Open"

    assert_equal(expected, actual)
  end
end
