class Product
  include Comparable
  attr_accessor :title, :times_purchased, :price

  def initialize(args)
    @title = args[:title]
    @times_purchased = args[:popularity].to_i
    @price = args[:price].to_i
  end

  def <=>(other)
    if times_purchased < other.times_purchased
      return 1
    elsif times_purchased == other.times_purchased && price > other.price
      return 1
    else
      return -1
    end    
  end
end

class ProductList
  def initialize(input_array)
    @products_input = input_array
  end

  def products_list
    @products_list ||= build_products_list
  end

  def sorted
    @sorted_products ||= products_list.sort
  end

  private

  def build_products_list
    products_list = []
    @products_input.each do |product_row|
      prod_array = product_row.split(",")
      product = Product.new({:title => prod_array[0], :popularity => prod_array[1], :price => prod_array[2]})

      products_list << product
    end
    products_list
  end
end

sample_input = [
  "Selfie Stick,98,29",
  "iPhone Case,90,15",
  "Fire TV Stick,48,49",
  "Wyze Cam,48,25",
  "Water Filter,56,49",
  "Blue Light Blocking Glasses,90,16",
  "Ice Maker,47,119",
  "Video Doorbell,47,199",
  "AA Batteries,64,12",
  "Disinfecting Wipes,37,12",
  "Baseball Cards,73,16",
  "Winter Gloves,32,112",
  "Microphone,44,22",
  "Pet Kennel,5,24",
  "Jenga Classic Game,100,7",
  "Ink Cartridges,88,45",
  "Instant Pot,98,59",
  "Hoze Nozzle,74,26",
  "Gift Card,45,25",
  "Keyboard,82,19"
]

available_products = ProductList.new(sample_input)

puts available_products.sorted.map(&:title)



