class Cell 

  attr_reader :x, :y, :neighbours_hash
  attr_accessor :alive

  def initialize(alive, x, y)
    @alive = alive
    @x = x
    @y = y
  end

  def to_s
    @alive ? '1' : '0'
  end

  def neighbours_hash
    @neighbours_hash ||= {   
      top_left: [@x - 1, @y - 1], 
      top: [@x, @y - 1],
      top_right: [@x + 1, @y - 1],
      left: [@x - 1, @y],
      right: [@x + 1, @y],
      bottom_left: [@x - 1, @y + 1],
      bottom: [@x, @y + 1],
      bottom_right: [@x + 1, @y + 1],
    }
  end
end