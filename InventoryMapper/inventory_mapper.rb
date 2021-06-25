class Product 
  
  attr_accessor :title, :parts_required

  def initialize(title, parts_hash)
    @title = title
    @parts_required = parts_hash
  end

  def to_s 
    "Product title: #{title}\nParts required: #{parts_required}"
  end

end

class InventoryMapper 

  attr_accessor :products_to_build

  def initialize(array_of_products) 
    @products_to_build = array_of_products
  end

  def build_products_with(input)
    part_hash = get_part_hash(input)
    product_hash = {}

    @products_to_build.each do |product|
      parts_array = []
      product_hash.store(product.title.to_sym, 0)

      product.parts_required.each do |key, num_required|    
        unless part_hash[key.to_sym].nil?
          num_of_part = part_hash[key.to_sym]
          parts_array << num_of_part / num_required
        end
      end

      product_hash[product.title.to_sym] = parts_array.min unless parts_array.empty?
    end

    product_hash
  end

  private

  # Creates hash of characters as key and quantity as value
  def get_part_hash(part_ids)
    part_hash = {}

    part_ids.split("").each do |id|
      if part_hash.has_key?(id.to_sym)
        part_hash[id.to_sym] += 1
      else 
        part_hash[id.to_sym] = 1
      end
    end
    part_hash
  end

end

stool = Product.new("Stool", {"b": 1, "c": 3})
shelf = Product.new("Shelf", {"a": 1})
table = Product.new("Table", {"d": 1, "e": 4})

inventory_mapper = InventoryMapper.new([shelf, stool, table])

puts "abccc"
puts inventory_mapper.build_products_with("abccc")

puts "beceadee"
puts inventory_mapper.build_products_with("beceadee")

puts "eebeedebaceeceedeceacee"
puts inventory_mapper.build_products_with("eebeedebaceeceedeceacee")

puts "zabc"
puts inventory_mapper.build_products_with("zabc")

puts "deeedeee"
puts inventory_mapper.build_products_with("deeedeee")

