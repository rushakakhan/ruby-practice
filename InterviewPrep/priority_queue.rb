class Element 
  include Comparable

  attr_accessor :key, :priority

  def initialize(key, priority)
    @key = key
    @priority = priority
  end

  def <=>(other)
    @priority <=> other.priority
  end
end


class PriorityQueue

  def initialize
    @elements = []
  end

  def <<(element)
    @elements << element
  end

  def bubble_up(index)
    parent_index = (index / 2)

    return if parent_index <= 1
    return if @elements[index] <= @elements[parent_index]

    exchange(index, parent_index)

    bubble_up(parent_index)
  end

  def exchange(source, target)
    temp = @elements[target]
    @elements[target] = @elements[source]
    @elements[source] = temp
  end

  def pop
    # exchange the root with the last element
    exchange(1, @elements.size - 1)

    # remove the last element from the list
    max = @elements.pop

    # and make sure the tree is ordered again
    bubble_down(1)
    max
  end

  def bubble_down
    
  end
end