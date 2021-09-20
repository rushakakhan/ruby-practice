require_relative 'cell.rb'

class Board

  attr_reader :board_array

  def initialize(side_length, live_cells)
    @board_array = Array.new(side_length)
    build_board(side_length, live_cells)
  end

  def print_board
    puts board_string
  end

  def board_string
    board_string = ""
    @board_array.each do |row|
      row.each do |cell|
        board_string += cell.to_s
      end
      board_string += "\n"
    end
    board_string
  end

  def get_live_neighbours(cell) 
    valid_neighbours(cell).filter do |cell_coords|
      # Need to access board_array with y index first.
      # ie. board_array[y][x] 
      cell = @board_array[cell_coords[1]][cell_coords[0]]
      cell.alive
    end
  end

  private

  def build_board(n, live_cells)
    # Loop starts with y because 1st level of array is each row.
    # Each y row holds the array columns denoted by x.
    # [
    #   [x0_y0, x1_y0, x2_y0, x3_y0],
    #   [x0_y1, x1_y1, x2_y1, x3_y1],
    #   [x0_y2, x1_y2, x2_y2, x3_y2],
    #   [x0_y3, x1_y3, x2_y3, x3_y3]
    # ] 
    #
    n.times do |y|
      @board_array[y] = Array.new(n)
      n.times do |x|
        if live_cells.include? [x, y]
          @board_array[y][x] = Cell.new(true, x, y)
          next
        end
        @board_array[y][x] = Cell.new(false, x, y)        
      end
    end
    nil
  end

  def valid_neighbours(cell)
    side_length = @board_array.size
    valid_neighbours = []
    cell.neighbours_hash.each do |key, coords|
      x = coords[0]
      y = coords[1]
      unless x < 0 || x > side_length - 1 || y < 0 || y > side_length - 1
        valid_neighbours << coords
      end
    end
    valid_neighbours
  end
end