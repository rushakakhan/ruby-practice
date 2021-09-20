class CacheNode

  attr_reader :key, :value
  attr_accessor :next, :prev

  def initialize(key, value, nextNode, prevNode)
    @key = key
    @value = value
    @next = nextNode
    @prev = prevNode
  end
end

class Cache

  attr_reader :max_size
  attr_accessor :data, :most_neglected, :least_neglected

  def initialize(args)
    @max_size = args[:max_size]
    @data = {}
    @least_neglected = nil
    @most_neglected = nil
  end

  def write(key, value)
    delete(key)

    node = CacheNode.new(key, value, nil, nil)

    push_to_front(node)

    @most_neglected = node if @most_neglected.nil?

    @data[key] = node

    shift(@most_neglected.key) if @data.size > max_size

    node.value
  end

  def read(key)
    return nil unless @data.has_key?(key)

    value = @data[key].value

    delete(key)

    node = CacheNode.new(key, value, nil, nil)

    push_to_front(node)

    @data[key] = node

    value
  end

  def delete(key)
    if @most_neglected && @data[key] == @most_neglected 
      shift(key)
      return
    end
     
    if @least_neglected && @data[key] == @least_neglected
      pop(key)
      return 
    end

    unlink(@data[key]) if @data.has_key?(key) 
  end

  def clear
    size = @data.size
    @data.clear
    @most_neglected = nil
    @least_neglected = nil
    size
  end

  def count
    @data.size
  end

  def to_h
    hash = {}
    @data.each do |key, node|
      hash[key] = node.value
    end
    hash
  end

  #private

  def unlink(node)
    before = node.prev
    after = node.next

    after.prev = before
    before.next = after

    node.prev = nil
    node.next = nil

    @data.delete(node.key)
  end

  def push_to_front(node)
    node.prev = @least_neglected

    unless @least_neglected.nil? 
      @least_neglected.next = node
    end

    @least_neglected = node
  end

  # remove most neglected entry and set new tail
  def shift(key)
    new_tail = @most_neglected.next

    @most_neglected.next = nil

    new_tail.prev = nil

    @most_neglected = new_tail

    @data.delete(key)
  end

  # remove least neglected entry and set new head
  def pop(key)
    new_head = @least_neglected.prev

    @least_neglected.prev = nil

    new_head.next = nil

    @least_neglected = new_head

    @data.delete(key)
  end
end
