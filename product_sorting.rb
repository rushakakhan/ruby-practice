class ProductList

  attr_reader :products_array

  def initialize(input_array)
    @products_array = input_array
  end

  def sorted_products
    @sorted_products ||= sort_products_by_popularity_and_price(products_array)
  end

  private

  def sort_products_by_popularity_and_price(input_array)
    sorted = []
    input_array.each do |product_row|
      prod_hash = string_to_hash(product_row, ",", ["title", "popularity", "price"])
      index = 0

      until sorted[index].nil? || sorted[index][:popularity].to_i < prod_hash[:popularity].to_i
        break if sorted[index][:popularity].to_i == prod_hash[:popularity].to_i && sorted[index][:price].to_i > prod_hash[:price].to_i
        index += 1        
      end

      sorted.insert(index, prod_hash)
    end

    sorted
  end

  def string_to_hash(string, seperator, keys)
    string_array = string.split(seperator)
    hash = Hash.new
    keys.each_with_index { |key, index| hash.store(key.to_sym, string_array[index]) }
    hash
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

puts available_products.sorted_products.map { |product| product[:title] }



