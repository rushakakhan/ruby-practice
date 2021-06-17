require 'minitest/autorun'

require_relative '../Assignments/ForTheOop/user.rb'
require_relative '../Assignments/ForTheOop/property_listing.rb'

class TestPropertyListing < Minitest::Test
  
  def setup
    @user = User.new("Craig Rushon")
    @listing = PropertyListing.new("56 White Oak Drive", "Jim Morrison", 2400, "Kyle S", 285000)
  end

  def test_that_offers_sent_is_empty
    assert(@user.offers_sent.empty?)
  end

  def test_that_offers_accepted_is_empty
    assert(@user.offers_accepted.empty?)
  end

  def test_that_favorites_is_empty
    assert(@user.favorites.empty?)
  end

  def test_submit_offer_works_to_add_offer_to_offers_sent
    offer = @user.submit_offer(@listing, 292500)

    actual = @user.offers_sent.first
    expected = offer

    assert_equal(expected, actual)
  end

  def test_submit_offer_works_to_add_offer_to_listing
    offer = {name: @user.name, amount: 292500}
    @user.submit_offer(@listing, 292500)

    actual = @listing.bids.include?(offer)
    expected = true

    assert_equal(expected, actual)
  end
end
