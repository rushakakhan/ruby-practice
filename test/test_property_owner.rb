require 'minitest/autorun'

require_relative '../Assignments/ForTheOop/property.rb'
require_relative '../Assignments/ForTheOop/property_owner.rb'

class TestPropertyListing < Minitest::Test
  
  def setup
    @owner = PropertyOwner.new("Craig Rushon")
    @property = Property.new("56 White Oak Drive", @owner.name, 2400)
  end

  def test_that_properties_is_empty
    assert(@owner.properties.empty?)
  end

  def test_that_listings_is_empty
    assert(@owner.listings.empty?)
  end

  def test_add_property_works
    @owner.add_property(@property)

    actual = @owner.properties.first
    expected = @property

    assert_equal(expected, actual)
  end

  def test_get_property_works
    property2 = Property.new("222 Elgin St.", "Jim Morrison", 3404.89)
    @owner.add_property(@property)
    @owner.add_property(property2)
    
    actual = @owner.get_property(1)
    expected = property2

    assert_equal(expected, actual)
  end

  def test_get_listing_works
    property2 = Property.new("222 Elgin St.", "Jim Morrison", 3404.89)
    @owner.add_property(@property)
    @owner.add_property(property2)
    listing = @owner.create_listing_from_property(1, "It Me", 305500)
    
    actual = @owner.get_listing(0)
    expected = listing

    assert_equal(expected, actual)
  end
end
