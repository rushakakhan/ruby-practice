class Textogram

  def initialize(text, case_sensitive = false, include_special_chars = false, words_instead_of_chars = false)
    @text = text
    @case_sensitive = case_sensitive
    @include_special = include_special_chars
    @words_instead = words_instead_of_chars
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
    text = text.gsub(/[^0-9A-Za-z]/, ' ') unless @include_special
    raise "No valid characters to work with." if text == ""
    text.downcase! unless @case_sensitive

    if @words_instead
      splitter = " "
    else
      splitter = ""
    end
    chars = text.split(splitter).sort

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

test_default_chars = Textogram.new("HELLO World!")
test_default_chars_with_case = Textogram.new("HELLO World!", true)
test_default_chars_with_special = Textogram.new("HELLO World!", false, true)
test_default_chars_with_both = Textogram.new("HELLO World!", true, true)

words_default = Textogram.new("HELLO World! My name is World! I mean Craig...my name is CRAIG.", false, false, true)
words_case_sensitive = Textogram.new("HELLO World! My name is World! I mean Craig...my name is CRAIG.", true, false, true)
words_special_chars = Textogram.new("HELLO World! My name is World! I mean Craig...my name is CRAIG.", false, true, true)
words_with_both = Textogram.new("HELLO World! My name is World! I mean Craig...my name is CRAIG.", true, true, true)

p test_default_chars.to_hash
p test_default_chars_with_case.to_hash
p test_default_chars_with_special.to_hash
p test_default_chars_with_both.to_hash

p words_default.to_hash
p words_case_sensitive.to_hash
p words_special_chars.to_hash
p words_with_both.to_hash


