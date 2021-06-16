module AcceptsBids

  def bids
    @bids ||= []
  end

  def add_bid(name, amount)
    bid = { name: name, amount: amount }
    bids << bid
    bid.merge(:listing => self)
  end

  def get_bid(index)
    if index < 0 || index >= bids.length
      raise "No bid found with that index. There are #{bids.length} bid(s) currently."
    end
    bids[index]
  end

  def print_bids
    if @bids.length == 0
      puts "No bids yet."
    end
    puts "#{@bids.length} bid(s) found:"
    puts "-----------------------------"
    @bids.each { |bid| puts "#{bid[:name]}'s bid is $#{bid[:amount]}" }
    puts "-----------------------------"
  end

  def get_highest_bid
    @bids.max_by { |bid| bid[:amount] }
  end

end