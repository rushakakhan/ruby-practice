class GildedRose

  attr_reader :items

  AGED_BRIE = "Aged Brie"
  BACKSTAGE_PASS = "Backstage passes to a TAFKAL80ETC concert"
  SULFURAS = "Sulfuras, Hand of Ragnaros"
  CONJURED = "Conjured Mana Cake"

  def initialize(items)
    @items = items
  end

  def update_quality
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

      item.quality = sellable.quality
      item.sell_in = sellable.sell_in
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

  def initialize(name, sell_in, quality)
    super(name, sell_in, quality)
  end

  def update_quality 
    if self.sell_in < 0
      self.quality -= AFTER_DATE_DEGRADING_RATE
    else
      self.quality -= DEFAULT_DEGRADING_RATE
    end
  end

  def update_sell_in
    self.sell_in -= DEFAULT_DEGRADING_RATE
  end
end

class AgedBrie < Sellable 

  def update_quality
    if self.sell_in < 0
      self.quality += 2
    else
      self.quality += 1
    end
  end

  def update_sell_in
    self.sell_in -= 1
  end

end

class BackstagePass < Sellable

  def update_quality 
    rate = 1
    if self.sell_in < 0 
      self.quality = 0
      return
    elsif self.sell_in <= 5
      rate = 3
    elsif self.sell_in <= 10
      rate = 2
    end

    self.quality += rate
  end

  def update_sell_in
    self.sell_in -= 1
  end

end

class Sulfuras < Sellable

  def initialize(name, sell_in, quality)
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
    if self.sell_in < 0
      self.quality -= 4
    else
      self.quality -= 2
    end
  end

  def update_sell_in
    self.sell_in -= 1
  end

end