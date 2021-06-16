require_relative 'property.rb'
require_relative 'mixins.rb'

class PropertyListing < Property

  include AcceptsBids

  attr_reader :listing_agent, :asking_price, :status, :date_created

  def listing_agent=(name)
    if name == ""
      raise "Listing Agent can't be blank!"
    end
    @listing_agent = name.to_s
  end

  def asking_price=(price)
    if price <= 0
      raise "Price must be greater than 0."
    end
    @asking_price = price.to_s
  end

  def status=(status)
    unless status.downcase == "sold" || status.downcase == "open" || status.downcase == "cancelled"
      raise "Invalid status"
    end
    @status = status.downcase.capitalize
  end

  def initialize(address, owner, taxes, agent, asking_price)
    super(address, owner, taxes)
    self.listing_agent = agent
    self.asking_price = asking_price
    self.status = "Open"
    @date_created = Time.now
  end

  def to_s
    "Address: #{@address}\nListing Agent: #{@listing_agent}\nAsking price: $#{@asking_price}\nStatus: #{@status}"
  end  
end