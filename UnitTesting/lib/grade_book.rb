class GradeBook

  attr_reader :grades

  def initialize
    @grades = Hash.new(0)
  end

  def add_grade(student, grade)
    @grades[student.to_sym] = grade.to_f
  end

  def get_grade(student)
    @grades[student.to_sym]
  end

  def letter_grades
    @grades.transform_values { |number| number.to_grade }
  end

  def letter_grade(student)
    get_grade(student).to_grade
  end

end

class Float

  def to_grade
    number = self.to_f
    if number < 50
      'F'
    elsif number < 60
      'D'
    elsif number < 70
      'C'
    elsif number < 80
      'B'
    else
      'A'
    end
  end
end