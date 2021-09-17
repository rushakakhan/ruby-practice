require 'minitest/autorun'
require './InterviewPrep/lru_cache_linked_list'

class TestLruCacheLinkedList < Minitest::Test

  def setup

    @cache = Cache.new(max_size: 3)
    @full_cache = Cache.new(max_size: 3)

    @full_cache.write("key1", "val1")
    @full_cache.write("key2", "val2")
    @full_cache.write("key3", "val3")

  end

  def test_write_before_max_size_reached

    val1 = @cache.write("key1", "val1")
    assert_equal(val1, "val1")
    
    val2 = @cache.write("key2", "val2")
    assert_equal(val2, "val2")

    val3 = @cache.write("key3", "val3")
    assert_equal(val3, "val3")

    expected = {"key1" => "val1", "key2" => "val2", "key3" => "val3"}
    assert_equal(expected, @cache.to_h)
  end

  def test_write_when_at_max_size_already

    val = @full_cache.write("key4", "val4")
    assert_equal(val, "val4")

    expected = {"key2" => "val2", "key3" => "val3", "key4" => "val4"}
    assert_equal(expected, @full_cache.to_h)

  end
  
  def test_read_when_at_max_size

    @full_cache.write("key4", "val4")
    val = @full_cache.read("key1")
    assert_nil(val)

    val = @full_cache.read("key2")
    assert_equal("val2", val)

    expected = {"key3" => "val3", "key4" => "val4", "key2" => "val2"}
    assert_equal(expected, @full_cache.to_h)

  end

  def test_overwrite_existing_key

    @full_cache.write("key4", "val4")
    val = @full_cache.write("key3", "val3-overwrite")
    assert_equal("val3-overwrite", val)

    expected = {"key2" => "val2", "key4" => "val4", "key3" => "val3-overwrite"}
    assert_equal(expected, @full_cache.to_h)

  end
  
  def test_delete

    @full_cache.delete("key1")
    expected = {"key2" => "val2", "key3" => "val3"}
    assert_equal(expected, @full_cache.to_h)

  end

  
  def test_clear

    count = @full_cache.clear

    assert_equal(3, count)
    assert_equal(@full_cache.to_h, {})

  end

  
  def test_count

    count = @full_cache.count

    assert_equal(3, count)

  end

  
  def test_to_h

    expected = {"key1" => "val1", "key2" => "val2", "key3" => "val3"}
    assert_equal(expected, @full_cache.to_h)

  end

  
  def test_unlink

  end

  
  def test_push_to_front

  end

  
  def test_shift

  end

  
  def test_pop

  end

end