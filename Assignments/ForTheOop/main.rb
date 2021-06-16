require_relative 'property'
require_relative 'property_listing'
require_relative 'property_owner'

me = PropertyOwner.new("Craig Rushon")
me.add_property("333 Northland Rd, Sault Ste. Marie, ON", 1940.00)
me.add_property("56 White Oak Drive, Sault Ste. Marie, ON", 2100)
me.add_property("270 Upton St, Ottawa, ON", 2345.0)
me.print_all_properties

listing =  me.create_listing_from_property(1, "Kyle Schiender", 339900)
me.create_listing_from_property(2, "Kyle Schiender", 290000)
me.print_all_listings

#test_prop = me.get_property(1)
#puts test_prop.to_s

listing.add_bid("Jimmy H", 345000)
listing.add_bid("Emily M", 350000)
listing.add_bid("Crystal Z", 360000)

listing.print_bids

me.accept_offer(listing, 1)

me.print_all_properties

