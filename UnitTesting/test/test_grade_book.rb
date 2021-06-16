require 'minitest/autorun'
require 'grade_book'

class TestGradeBook < Minitest::Test

  def setup
    @grade_book = GradeBook.new
    @grade_book.add_grade("christine", 87)
  end

  def test_add_grade_works
    expected = {"christine": 87.0}
    actual = @grade_book.grades

    assert_equal(expected, actual)
  end

  def test_get_grade_works
    assert_equal(87.0, @grade_book.get_grade("christine"))
  end

  def test_letter_grades_works
    expected = {"christine": 'A'}
    assert_equal(expected, @grade_book.letter_grades)
  end

  def test_letter_grade_works
    assert_equal('A', @grade_book.letter_grade("christine"))
  end
end

