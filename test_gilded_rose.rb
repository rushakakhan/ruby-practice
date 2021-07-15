require 'minitest/autorun'
require_relative 'gilded_rose'

class TestGildedRose < Minitest::Test

  def setup

    @items = [
      Item.new("Aged Brie", 5, 20),
      Item.new("Aged Brie", -1, 30),
      Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 20),
      Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 20),
      Item.new("Backstage passes to a TAFKAL80ETC concert", -1, 20),
      Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
      Item.new("Milk", -1, 5),
      Item.new("Chocolate", 15, 40)
    ]

    @inventory = GildedRose.new(@items)

  end

  def test_update_aged_brie_quality

    @inventory.update_quality

    expected = 21
    actual = @inventory.items.first.quality

    assert_equal(expected, actual)

    expected = 32
    actual = @inventory.items[1].quality

    assert_equal(expected, actual)

  end

  def test_update_on_backstage_pass_quality

    @inventory.update_quality

    expected = 23
    actual = @inventory.items[2].quality

    assert_equal(expected, actual)

    expected = 22
    actual = @inventory.items[3].quality

    assert_equal(expected, actual)

    expected = 0
    actual = @inventory.items[4].quality

    assert_equal(expected, actual)

  end

  def test_update_on_sulfuras_quality

    5.times { @inventory.update_quality } 

    expected = 80
    actual = @inventory.items[5].quality

    assert_equal(expected, actual)

  end

  def test_update_on_regular_items_quality

    @inventory.update_quality

    expected = 3
    actual = @inventory.items[6].quality

    assert_equal(expected, actual)

    expected = 39
    actual = @inventory.items[7].quality

    assert_equal(expected, actual)

  end
  

end