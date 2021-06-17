class Property

  attr_reader :address, :owner, :taxes

  def address=(address)
    if address == ""
      raise "Address can't be blank!"
    end
    @address = address
  end

  def owner=(owner)
    if owner == ""
      raise "Owner can't be blank!"
    end
    @owner = owner.to_s
  end

  def taxes=(amount)
    if amount.to_f <= 0
      raise "Taxes must be a dollar value greater than 0."
    end
    @taxes = format("%.2f", amount)
  end

  def initialize(address, owner, taxes)
    self.address = address
    self.owner = owner
    self.taxes = taxes
  end

  def to_s
    "Address: #{@address}\nOwned by: #{@owner}\nProperty taxes: $#{@taxes} per year"
  end
end