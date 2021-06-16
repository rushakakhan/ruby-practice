class User

  attr_reader :name, :offers_sent, :offers_accepted, :favorites

  def name=(name)
    if name.to_s == ""
      raise "Name can't be blank!"
    end
    @name = name.to_s
  end

  def initialize(name)
    self.name = name
    @offers_sent = []
    @offers_accepted = []
    @favorites = []
  end

  def submit_offer(listing, amount)
    offer = listing.add_bid(@name, amount)
    @offers_sent << offer
    offer
  end

  def add_favorite(listing)
    @favorites << listing
  end

  def print_sent_offers
    @offers_sent.each { |offer| puts "Offered #{offer[:amount]} for #{offer[:listing].address}" }
  end

  def print_accepted_offers
    @offers_accepted.each { |offer| puts "Accepted offer of #{offer[:amount]} for #{offer[:listing].address}" }
  end

  def print_favorites
    @favorites.each { |listing| puts "#{listing.to_s}"}
  end
end