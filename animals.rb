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
end

class Bird < Animal
  def talk
    puts "#{@name} says Chirp! Chirp!"
  end

  def move(destination)
    puts "#{@name} flies to the #{destination}."
  end
end



class Cat < Animal
  def talk
    puts "#{@name} says Meow!"
  end
  def move(destination)
    puts "#{@name} runs to the #{destination}."
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

pop = Cat.new
pop.name = "Poppy"
pop.age = 2

chirpy.move("tree")
sandy.talk
sandy.report_age
willow.move("house")
willow.report_age
pop.report_age
puts "Her name is #{pop.name}!"

