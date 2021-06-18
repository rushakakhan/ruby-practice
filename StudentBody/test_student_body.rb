require 'minitest/autorun'
require_relative 'student_body'

class TestStudentBody < Minitest::Test

  def setup
    @school = StudentBody.new
  end

  def test_to_s_method_works
    @school.add_students_to_class("Grade 7", ["Bobby J", "Chrissy M", "Billy K", "Sean D", "Sally S", "Abby J", "Mark S"])
    expected = "----------------------\nGrade 7 Class:\nBobby J\nChrissy M\nBilly K\nSean D\nSally S\nAbby J\nMark S\n----------------------"

    assert_equal(expected, @school.to_s)
  end

  def test_add_student_to_existing_class_works
    @school.add_students_to_class("Grade 7", ["Bobby J", "Chrissy M", "Billy K", "Sean D", "Sally S", "Abby J", "Mark S"])
    @school.add_student_to_class("Grade 7", "Craig R")
    expected = {:"Grade 7"=>["Bobby J", "Chrissy M", "Billy K", "Sean D", "Sally S", "Abby J", "Mark S", "Craig R"]}

    assert_equal(expected, @school.class_lists)
  end

  def test_add_student_to_wrong_class_fails
    assert_raises(RuntimeError) do
      @school.add_student_to_class("Grade 8", "Craig R")
    end
  end

  def test_add_students_to_class_works_with_new_class
    @school.add_students_to_class("Grade 7", ["Bobby J", "Chrissy M", "Billy K", "Sean D", "Sally S", "Abby J", "Mark S"])
    expected = {:"Grade 7"=>["Bobby J", "Chrissy M", "Billy K", "Sean D", "Sally S", "Abby J", "Mark S"]}

    assert_equal(expected, @school.class_lists)
  end

  def test_add_students_to_class_works_with_existing_class
    @school.add_students_to_class("Grade 7", ["Bobby J", "Chrissy M", "Billy K", "Sean D", "Sally S", "Abby J", "Mark S"])
    @school.add_students_to_class("Grade 7", ["New Student", "Second NewStudent"])
    expected = {:"Grade 7"=>["Bobby J", "Chrissy M", "Billy K", "Sean D", "Sally S", "Abby J", "Mark S", "New Student", "Second NewStudent"]}
    assert_equal(expected, @school.class_lists)
  end

end
