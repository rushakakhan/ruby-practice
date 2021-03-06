require 'minitest/autorun'
require './game_of_life.rb'

class TestCellObject < Minitest::Test

  def test_to_s
    alive = Cell.new(true, 0, 0)
    assert_equal("1", alive.to_s)

    dead = Cell.new(false, 0, 0)
    assert_equal("0", dead.to_s)
  end

  def test_valid_neighbours

  end

  def test_cell_neighbours_hash

    cell1 = Cell.new(true, 0, 1)
    actual = cell1.neighbours_hash
    expected = {
      :top_left => [-1, 0],
      :top => [0, 0],
      :top_right => [1, 0], 
      :left => [-1, 1], 
      :right => [1, 1],
      :bottom_left => [-1, 2],
      :bottom => [0, 2],
      :bottom_right => [1, 2]
    }
    assert_equal(expected, actual)

    cell2 = Cell.new(true, 1, 0)
    actual = cell2.neighbours_hash
    expected = {
      :top_left => [0, -1],
      :top => [1, -1],
      :top_right => [2, -1], 
      :left => [0, 0], 
      :right => [2, 0],
      :bottom_left => [0, 1],
      :bottom => [1, 1],
      :bottom_right => [2, 1]
    }
    assert_equal(expected, actual)

    cell3 = Cell.new(true, 1, 2)
    actual = cell3.neighbours_hash
    expected = {
      :top_left => [0, 1],
      :top => [1, 1],
      :top_right => [2, 1], 
      :left => [0, 2], 
      :right => [2, 2],
      :bottom_left => [0, 3],
      :bottom => [1, 3],
      :bottom_right => [2, 3]
    }
    assert_equal(expected, actual)

    cell4 = Cell.new(true, 3, 3)
    actual = cell4.neighbours_hash
    expected = {
      :top_left => [2, 2],
      :top => [3, 2],
      :top_right => [4, 2], 
      :left => [2, 3], 
      :right => [4, 3],
      :bottom_left => [2, 4],
      :bottom => [3, 4],
      :bottom_right => [4, 4]
    }
    assert_equal(expected, actual)
  end

end