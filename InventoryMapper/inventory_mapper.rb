class InventoryMapper 

  def initialize 
    @product_hash = {"Shelf": 0, "Stool": 0, "Table": 0}
  end

  def get_complete_products(input)

    product_hash = @product_hash.clone
    part_hash = get_part_hash(input)

    product_hash[:"Shelf"] = part_hash["a"] unless part_hash["a"].nil?

    unless part_hash["b"].nil? || part_hash["c"].nil?
      if part_hash["b"] >=1 && part_hash["c"] >= 3
        complete = part_hash["b"] > part_hash["c"] / 3 ? part_hash["c"] / 3 : part_hash["b"] 
        product_hash[:"Stool"] = complete
      end
    end

    unless part_hash["d"].nil? || part_hash["e"].nil?
      if part_hash["d"] && part_hash["d"] >=1 && part_hash["e"] >= 4
        complete = part_hash["d"] > part_hash["e"] / 4 ? part_hash["e"] / 4 : part_hash["d"] 
        product_hash[:"Table"] = complete
      end
    end
    product_hash
  end

  private

  # Creates hash of characters as key and quantity as value
  def get_part_hash(part_ids)

    part_hash = {}
    part_ids.split("").each do |id|
      if id == "a" || id == "b" || id == "c" || id == "d" || id == "e"
        if part_hash.has_key?(id)
          part_hash[id] += 1
        else 
          part_hash[id] = 1
        end
      end
    end
    part_hash
  end

end


inventory_mapper = InventoryMapper.new

puts inventory_mapper.get_complete_products("abccc")
#puts "abccc"
#p inventory_mapper.get_part_hash("abccc")
puts inventory_mapper.get_complete_products("beceadee")
#puts "beceadee"
#p inventory_mapper.get_part_hash("beceadee")
puts inventory_mapper.get_complete_products("eebeedebaceeceedeceacee")
#puts "eebeedebaceeceedeceacee"
#p inventory_mapper.get_part_hash("eebeedebaceeceedeceacee")
puts inventory_mapper.get_complete_products("zabc")
#puts "zabc"
#p inventory_mapper.get_part_hash("zabc")
puts inventory_mapper.get_complete_products("deeedeee")
#puts "deeedeee"
#p inventory_mapper.get_part_hash("deeedeee")
