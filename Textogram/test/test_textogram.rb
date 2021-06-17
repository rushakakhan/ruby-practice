require 'minitest/autorun'
require 'textogram'

class TestTextogram < Minitest::Test

  def setup
    @default= Textogram.new("HELLO World!")
    @with_case = Textogram.new("HELLO World!", true)
    @with_special = Textogram.new("HELLO World!", false, true)
    @with_both = Textogram.new("HELLO World!", true, true)
  end

  def test_default_hash_output
    expected = {
      "d": 1,
      "e": 1,
      "h": 1,
      "l": 3,
      "o": 2,
      "r": 1,
      "w": 1 
    }
    assert_equal(expected, @default.to_hash)
  end

  def test_when_case_senstive_equals_true
    expected = {
      "E": 1,
      "H": 1,
      "L": 2,
      "O": 1,
      "W": 1,
      "d": 1,
      "l": 1,
      "o": 1,
      "r": 1
    }
    assert_equal(expected, @with_case.to_hash)
  end

  def test_when_special_characters_are_included
    expected = {
      "!": 1,
      "d": 1,
      "e": 1,
      "h": 1,
      "l": 3,
      "o": 2,
      "r": 1,
      "w": 1 
    }
    assert_equal(expected, @with_special.to_hash)
  end

  def test_to_hash_when_special_chars_included_and_case_sensitive
    expected = {
      "!": 1,
      "E": 1,
      "H": 1,
      "L": 2,
      "O": 1, 
      "W": 1,
      "d": 1,
      "l": 1,
      "o": 1,
      "r": 1
    }
    assert_equal(expected, @with_both.to_hash)
  end

  def test_to_string_method_works_with_default
    expected = "d *\ne *\nh *\nl ***\no **\nr *\nw *\n"
    assert_equal(expected, @default.to_s)
  end

  def test_to_string_method_works_with_case_sensitive_true
    expected = "E *\nH *\nL **\nO *\nW *\nd *\nl *\no *\nr *\n"
    assert_equal(expected, @with_case.to_s)
  end

  def test_to_string_method_works_when_special_chars_included
    expected = "! *\nd *\ne *\nh *\nl ***\no **\nr *\nw *\n"
    assert_equal(expected, @with_special.to_s)
  end

  def test_to_string_method_works_when_special_chars_included_and_case_sensitive
    expected = "! *\nE *\nH *\nL **\nO *\nW *\nd *\nl *\no *\nr *\n"
    assert_equal(expected, @with_both.to_s)
  end

end