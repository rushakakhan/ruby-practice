require_relative 'board.rb'

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

        live_neighbour_count = @board.get_live_neighbours(cell).size

        if cell.alive
          if live_neighbour_count < 2 || live_neighbour_count > 3
            next
          else
            live_cells << [x, y]
          end

        else
          if live_neighbour_count == 3
            live_cells << [x, y]
          end
        end
      end
    end
    @board = Board.new(board.size, live_cells)
    @rounds_run += 1
  end
end

n = 4
alive_array = [[1,1], [2,1], [2, 3]]
board = Board.new(n, alive_array)

game = GameOfLife.new(board, n)
game.run

