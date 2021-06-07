class Vehicle
  
  attr_accessor :odometer
  attr_accessor :gas_used

  def mileage
    @odometer / @gas_used
  end

  def accelerate 
    puts "Floor it!"
  end

  def sound_horn
    puts "Beep! Beep!"
  end

  def steer
    puts "Turn front 2 wheels."
  end
end

class Car < Vehicle
end

class Truck < Vehicle
end

class Motorcycle < Vehicle
end