require 'minitest/autorun'
require '../cell.rb'
require '../board.rb'

class TestBoardObject < Minitest::Test

  def setup
    size_of_board = 4
    alive_array = [[1,1], [2,1], [2, 3]]
    @board = Board.new(size_of_board, alive_array)
  end
  
  def test_print_board
    expected = "0000\n0110\n0000\n0010\n"
    assert_equal(expected, @board.board_string)
  end

  def test_board_coords_match_cell_coords
    x = 1
    y = 2
    # Remember we need to access array with array[y][x]
    actual = [@board.board_array[y][x].x, @board.board_array[y][x].y]
    expected = [x, y]
    assert_equal(expected, actual)
  end
end