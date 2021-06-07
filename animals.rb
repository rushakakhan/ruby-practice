class Animal

  attr_reader :name, :age

  def name=(value)
    if value == ""
      raise "Name can't be blank!"
    end
    @name = value
  end

  def age=(value)
    if value < 0
      raise "An age of #{value} isn't valid!"
    end
    @age = value
  end

  def report_age
    puts "#{@name} is #{@age} years old."
  end

  def talk
    puts "#{@name} says Bark!"
  end

  def move(destination)
    puts "#{@name} runs to the #{destination}."
  end
end

class Dog < Animal
  def to_s 
    "#{@name} the dog, age #{age}"
  end
end

class Cat < Animal
  def talk
    puts "#{@name} says Meow!"
  end
end

class Bird < Animal
  def talk
    puts "#{@name} says Chirp! Chirp!"
  end

  def move(destination)
    puts "#{@name} flies to the #{destination}."
  end
end

class Armadillo < Animal
  def move(destination)
    puts "#{name} unrolls!"
    super
  end
end

chirpy = Bird.new
chirpy.name = "Chirpy"
chirpy.age = 2

sandy = Dog.new
sandy.name = "Sandy"
sandy.age = 10


willow = Cat.new
willow.name = "Willow"
willow.age = 4

chirpy.move("tree")
sandy.talk
sandy.report_age
willow.move("house")
willow.report_age

puts sandy.to_s