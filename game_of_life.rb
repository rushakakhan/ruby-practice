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

  def valid_neighbours(side_length)
    valid_neighbours = []
    neighbours_hash.each do |key, coords|
      x = coords[0]
      y = coords[1]
      unless x < 0 || x > side_length - 1 || y < 0 || y > side_length - 1
        valid_neighbours << coords
      end
    end
    valid_neighbours
  end
  
  def live_neighbours(board)  
    valid_neighbours(board.size).filter do |cell_coords|
      # Need to access board_array with y index first.
      # ie. board_array[y][x] 
      cell = board[cell_coords[1]][cell_coords[0]]
      cell.alive
    end
  end
end


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
end

class GameOfLife

  attr_accessor :board
  
  def initialize (board, rounds) 
    @board = board
    @rounds = rounds
    @rounds_run = 0
  end

  def run
    puts "T=#{@rounds_run}"
    @board.print_board 
    while @rounds_run < @rounds 
      run_round
      puts "T=#{@rounds_run}"
      @board.print_board
    end
  end

  def run_round
    board = @board.board_array
    live_cells = []

    board.each_with_index do |row, y|
      row.each_with_index do |cell, x|

        live_neighbours = cell.live_neighbours(board)

        if cell.alive
          if live_neighbours.size < 2 || live_neighbours.size > 3
            next
          else
            live_cells << [x, y]
          end

        else
          if live_neighbours.size == 3
            live_cells << [x, y]
          end
        end
      end
    end
    @board = Board.new(board.size, live_cells)
    @rounds_run += 1
  end
end