class TreasureHunt

  def initialize
    @map = {}
  end

  def add_water_source(coords)
    @map[coords] = "W"
  end

  def add_food_source(coords)
    @map[coords] = "F"
  end

  def add_treasure(coords)
    @map[coords] = "X"
  end

  def to_s
    right = nil
    left = nil
    top = nil
    bottom = nil

    if @map.empty? 
      right = 12
      left = 0
      top = 6
      bottom = 0
    end
      

    @map.keys.each do |arr|
      x = arr.first
      y = arr.last

      right = x if right == nil || x > right
      left = x if left == nil || x < left
      top = y if top == nil || y > top
      bottom = y if bottom == nil || y < bottom
    end

    output = ""
    for j in bottom..top
      string = ""
      for i in left..right
        if @map[[i, j]] == nil
          string += "."
        else
          string += @map[[i, j]]
        end
      end
      string +="\n"
      output = string + output
    end
    output
  end
end

map = TreasureHunt.new

map.add_food_source([0,1])
map.add_food_source([11,0])
map.add_water_source([6,-2])
map.add_treasure([-1, -5])

empty_map = TreasureHunt.new

puts "Map with values:"
puts map.to_s
puts
puts "Empty map:"
puts empty_map.to_s