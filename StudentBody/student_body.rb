class StudentBody

  include Enumerable

  def initialize
    @class_lists = Hash.new
  end

  def class_lists
    @class_lists
  end

  def to_s
    string = "----------------------\n"
    @class_lists.each do |key, list|
      string += "#{key.to_s} Class:\n"
      list.each { |student| string += "#{student}\n"}
      string += "----------------------"
    end
    string
  end

  def add_class(class_name)
    unless @class_lists[class_name.to_sym]
      @class_lists.store(class_name.to_sym, [])
    end
  end

  def add_student_to_class(class_name, student_name)
    unless @class_lists.has_key?(class_name.to_sym)
      raise "No class found with that name"
    end
    @class_lists[class_name.to_sym] << student_name
  end

  def add_students_to_class(class_name, array_of_students)
    if @class_lists.has_key?(class_name.to_sym)
      @class_lists[class_name.to_sym].concat(array_of_students)
    else
      @class_lists[class_name.to_sym] = array_of_students
    end
  end

  def each 
    @class_lists.each do |key, list|
      list.each do |student|
        yield student
      end
    end
  end

end


school = StudentBody.new
school.add_students_to_class("Grade 7", ["Bobby J", "Chrissy M", "Billy K", "Sean D", "Sally S", "Abby J", "Mark S"])
p school.class_lists
puts school.to_s

billys = school.find_all { |student| student.split(" ").include?("Billy") }
p billys