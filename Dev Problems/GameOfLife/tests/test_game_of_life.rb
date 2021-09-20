require 'minitest/autorun'
require_relative '../game_of_life.rb'
require_relative '../board.rb'

class TestGameOfLifeObject < Minitest::Test

  def setup
    size_of_board = 4
    alive_array = [[1,1], [2,1], [2, 3]]
    @board = Board.new(size_of_board, alive_array)
  end

  def test_board_after_one_round
    rounds = 1
    game = GameOfLife.new(@board, rounds)
    game.run
    expected = "0000\n0000\n0110\n0000\n"
    actual = game.board.board_string
    assert_equal(expected, actual)
  end
end