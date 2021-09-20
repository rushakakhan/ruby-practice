require 'json'

class SearchEngine

  attr_reader :inverted_index

  def initialize(data, condition)
    @data = data
    @condition = condition 
    @inverted_index = build_inverted_index(@data)
  end

  def search(text)
    case @condition
    when :and
      #--------------------------------
      # Still need to finish this block
      #=-------------------------------
    when :or
      words = tokenize(text)
      product_ids = []
      words.each do |word| 
        product_ids.concat(@inverted_index[word])
      end
      return product_ids
    else
      raise ArgumentError, "Condition must be :and or :or"
    end
  end

  private

  def tokenize(text)
    text.downcase.split
  end

  def build_inverted_index(data)
    inverted_index = {}
    data.each do |product|
      words = tokenize(product["name"])
      words.each do |word|
        inverted_index[word] ||= []
        inverted_index[word] << product["id"]
      end
    end
    inverted_index
  end
end

products_data = JSON.parse(File.read("products_small.json"))
search_engine = SearchEngine.new(products_data, "OR")
p search_engine.search("steel keyboard")