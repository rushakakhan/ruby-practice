class Textogram

  def initialize(text, case_sensitive = false, include_special_chars = false)
    @text = text
    @case_sensitive = case_sensitive
    @include_special = include_special_chars
    if text == ""
      raise "Text cannot be blank!"
    else
      @hash = generate_textogram(text)
    end
  end

  def to_hash
    @hash
  end

  def to_s
    string = ""
    @hash.each do |char, count|
      string += "#{char} "
      string += "*" * count
      string += "\n"
    end
    string
  end

  private

  def generate_textogram(text)
    hash = Hash.new
    text = text.gsub(/[^0-9A-Za-z]/, '') unless @include_special
    text.downcase! unless @case_sensitive
    chars = text.split("").sort

    chars.each do |c|
      next if c == " "
      char_sym = c.to_sym

      if hash.has_key?(char_sym)
        hash[char_sym] += 1
      else
        hash[char_sym] = 1
      end
    end
    hash
  end
end

testogram = Textogram.new("HELLO World!")
#blank_test = Textogram.new("") # Throws error: 'Text cannot be blank'

p testogram.to_hash


