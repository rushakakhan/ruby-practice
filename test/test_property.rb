require 'minitest/autorun'

require_relative '../Assignments/ForTheOop/property.rb'

class TestPropertyListing < Minitest::Test
  
  def setup
    @property = Property.new("56 White Oak Drive, Ottawa, ON", "Craig Rushon", 2555.00)
  end

  def test_to_s_method

    actual = @property.to_s
    expected = "Address: 56 White Oak Drive, Ottawa, ON\nOwned by: Craig Rushon\nProperty taxes: $2555.00 per year"

    assert_equal(expected, actual)
  end
end
