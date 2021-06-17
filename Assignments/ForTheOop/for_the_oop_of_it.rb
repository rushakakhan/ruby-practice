require_relative 'property_listing.rb'

class SoldProperty < PropertyListing
  
  attr_reader :buyer, :sold_price, :date_sold

  def initialize(buyer, sold_price, listing)
    @buyer = buyer
    @sold_price = sold_price
    self.address = listing.address
    self.owner = listing.owner
    self.listing_agent = listing.listing_agent
    self.asking_price = listing.asking_price
    @date_sold = Time.now
  end

end


new_listing = PropertyListing.new("56 White Oak Drive, Ottawa, ON", "Brett Davidson", "Jimmy Salesman", 249900)

new_listing.add_bid("Craig Rushon", 255000)
new_listing.add_bid("Sandi Metz", 266500)

new_listing.print_bids
puts "The highest bid is: #{new_listing.get_highest_bid}"

sold_property = new_listing.accept_offer(1)

puts sold_property.buyer, sold_property.sold_price