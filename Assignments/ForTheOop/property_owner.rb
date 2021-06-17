require_relative 'user.rb'
require_relative 'property.rb'
require_relative 'property_listing.rb'

class PropertyOwner < User

  attr_reader :properties, :listings

  def initialize(name)
    super
    @properties = []
    @listings = []
  end

  def add_property(property)
    @properties << property
  end

  def add_property(address, taxes)
    prop = Property.new(address, @name, taxes)
    @properties << prop
  end

  def get_property(index)
    if index < 0 || index >= @properties.length
      raise "Invalid property index."
    end
    @properties[index]
  end

  def get_listing(index)
    if index < 0 || index >= @listings.length
      raise "Invalid listing index."
    end
    @listings[index]
  end

  def create_listing_from_property(index, listing_agent, list_price)
    property = get_property(index)
    listing = PropertyListing.new(property.address, property.owner, property.taxes, listing_agent, list_price)
    @listings << listing
    listing
  end

  def print_all_properties
    @properties.each_with_index { |prop, index| puts "Property ##{index + 1}: #{prop.address}" }
  end

  def print_all_listings
    @listings.each_with_index do |listing, index| 
      puts "------------------------------"
      puts "Listing #{index + 1}"
      puts "------------------------------"
      puts listing.to_s
      puts "------------------------------"
    end
  end

  def print_bids_for_listing(index)
    listing = get_listing(index)
    listing.print_bids
  end

  def accept_offer(listing, bid_index)
    raise "You can't accept offers on listings you do not own." if !@listings.include?(listing)
    bid = listing.get_bid(bid_index)

    buyer = bid[:name]
    sold_price = bid[:amount]
    puts "#{@name} accepted #{buyer}'s offer of #{sold_price}, for the '#{listing.address}' property."
    
    listing.status = "Sold"
    @properties = @properties.find_all { |prop| prop.address != listing.address }
  end

end

