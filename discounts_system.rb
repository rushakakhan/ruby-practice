require 'active_support/inflector'

class Product 

  attr_accessor :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

end

class LineItem 

  attr_accessor :line_price, :discounted_by
  attr_reader :product, :quantity

  def initialize(product, quantity)
    @product = product
    @quantity = quantity
    @line_price = @product.price * quantity
    @discounted_by = nil
  end

end

class BuyOneGetOne

  def initialize(buy_product, get_product)
    @buy_product = buy_product
    @get_product = get_product
  end

  def apply_discount(cart_items)
    count_buy = 0

    cart_items.each do |item|
      if item.product == @buy_product
        if count_buy >= 1 || item.quantity > 1
          num_left = item.quantity - 1 
          item.line_price = num_left * item.product.price 
          item.discounted_by = 1 - (100.0 / item.quantity / 100)
          count_buy = num_left
        else
          count_buy += 1 
        end
      end
    end

    cart_items
  end

end

class BuyXGetYOffZ

  def initialize(buy_product, buy_quantity, product_to_discount, discount_percentage)
    @buy_product = buy_product
    @buy_quantity = buy_quantity
    @product_to_discount = product_to_discount
    @discount = discount_percentage
  end

  def apply_discount(cart_items)
    trigger_products = []
    qualified_items = []

    cart_items.each_with_index do |line, index| 
      line.quantity.times { trigger_products << line.product } if line.product == @buy_product
      qualified_items << {position: index, discount: @discount } if line.product == @product_to_discount
    end

    if trigger_products.length >= @buy_quantity
      qualified_items.each do |item|
        index = item[:position]
        cart_item = cart_items[index]
        item_price = cart_item.line_price 
        cart_item.line_price = (item_price * (1 - item[:discount] / 100.0)).round(2)
        cart_item.discounted_by = item[:discount] / 100.0
      end
      cart_items
    else
      []
    end
  end

end


class Cart

  attr_reader :line_items

  def initialize(input, discounts)
    @input = input
    @discounts = discounts
    @line_items = process_input(input)
    apply_discounts!
  end

  def total_price
    get_total(@line_items)
  end

  private

  def apply_discounts!
    @discounts.each { |discount| discount.apply_discount(@line_items) }
  end

  def get_total(array)
    total = 0.00

    array.each do |item|
      total += item.line_price
    end

    total
  end

  def process_input(input)
    line_items = input.map do |line|
      create_line_item(line)
    end
    line_items
  end

  def create_line_item(line)
    name_string = line[0].downcase
    quantity = line[1].to_i
    prod_obj = STORE_PRODUCTS.find { |product| product.name.downcase.pluralize == name_string }
    LineItem.new(prod_obj, quantity)
  end
end

apple = Product.new("Apple", 3.00)
peach = Product.new("Peach", 7.00)
grapes = Product.new("Grapes", 5.00)

STORE_PRODUCTS = [apple, peach, grapes]

sample_input = [ 
  ['grapes', 2], 
  ['apples', 2], 
  ['peaches', 1] 
]

ACTIVE_DISCOUNTS = [
  BuyOneGetOne.new(grapes, grapes),
  BuyXGetYOffZ.new(apple, 2, apple, 20)
]

#cart = Cart.new(sample_input, ACTIVE_DISCOUNTS)

items = [ ['grapes', 1], ['apples', 0], ['peaches', 1] ]
puts "for #{items}"
puts "Total = #{Cart.new(items, ACTIVE_DISCOUNTS).total_price}"

items = [ ['grapes', 1], ['apples', 1], ['peaches', 1] ]
puts "for #{items}"
puts "Total = #{Cart.new(items, ACTIVE_DISCOUNTS).total_price}"

items = [ ['grapes', 2], ['apples', 2], ['peaches', 1] ]
puts "for #{items}"
puts "Total = #{Cart.new(items, ACTIVE_DISCOUNTS).total_price}"

items = [['grapes', 3], ['apples', 5], ['peaches', 2] ]
puts "for #{items}"
puts "Total = #{Cart.new(items, ACTIVE_DISCOUNTS).total_price}"

items = [['grapes', 7], ['apples', 7], ['peaches', 7] ]
puts "for #{items}"
puts "Total = #{Cart.new(items, ACTIVE_DISCOUNTS).total_price}"

#puts "Total after discounts: #{cart.total}"