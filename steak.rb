class Steak
  GRADE_SCORES = {"Prime" => 3, "Choice" => 2, "Select" => 1}

  attr_accessor :grade

  def > (other)
    GRADE_SCORES[grade] > GRADE_SCORES[other.grade]
  end
end
