class GildedRose

  AGED_BRIE = "Aged Brie"
  BACKSTAGE_PASS = "Backstage passes to a TAFKAL80ETC concert"
  SULFURAS = "Sulfuras, Hand of Ragnaros"
  CONJURED = "Conjured Mana Cake"

  def initialize(items)
    @items = items
  end

  def update_inventory()
    @items.each do |item|
      case item.name
      when AGED_BRIE
        sellable = AgedBrie.new(item.name, item.sell_in, item.quality)
      when BACKSTAGE_PASS
        sellable = BackstagePass.new(item.name, item.sell_in, item.quality)
      when SULFURAS
        sellable = Sulfuras.new(item.name, item.sell_in, item.quality)
      when CONJURED
        sellable = Conjured.new(item.name, item.sell_in, item.quality)
      else
        sellable = Sellable.new(item.name, item.sell_in, item.quality)
      end
      sellable.update_quality
      sellable.update_sell_in
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end

class Sellable < Item

  DEFAULT_DEGRADING_RATE = 1
  AFTER_DATE_DEGRADING_RATE = 2

  def update_quality 
    if sell_in < 0
      quality -= AFTER_DATE_DEGRADING_RATE
    else
      quality -= DEFAULT_DEGRADING_RATE
    end
  end

  def update_sell_in
    sell_in -= DEFAULT_DEGRADING_RATE
  end
end

class AgedBrie < Sellable 

  def update_quality 
    quality += 1
  end

  def update_sell_in
    sell_in -= 1
  end

end

class BackstagePass < Sellable

  def update_quality 
    rate = 1
    if sell_in < 0 
      quality = 0
      return
    elsif sell_in <= 5
      rate = 3
    elsif sell_in <= 10
      rate = 2
    end

    quality += rate
  end

  def update_sell_in
    sell_in -= 1
  end

end

class Sulfuras < Sellable

  def initialize
    super("Sulfuras, Hand of Ragnaros", nil, 80)
  end

  def update_quality
    nil
  end

  def update_sell_in
    nil
  end

end

class Conjured < Sellable

  def update_quality 
    if sell_in < 0
      quality -= 4
    else
      quality -= 2
    end
  end

  def update_sell_in
    sell_in -= 1
  end

end