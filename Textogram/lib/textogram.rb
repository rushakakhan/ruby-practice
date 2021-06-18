class Textogram

  def initialize(text, case_sensitive = false, include_special_chars = false, words_instead_of_chars = false)
    @text = text
    @case_sensitive = case_sensitive
    @include_special = include_special_chars
    @words_instead = words_instead_of_chars
    if text == ""
      raise "Text cannot be blank!"
    else
      @hash = generate_hash(text)
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

  # It would be nice to remove punctuation from words, as those shouldn't be considered as part of a word

  def generate_array(text)
    text = text.gsub(/[^0-9A-Za-z]/, ' ') unless @include_special
    raise "No valid characters to work with." if text == ""
    text.downcase! unless @case_sensitive

    if @words_instead
      splitter = " "
    else
      splitter = ""
    end
    text.split(splitter).sort
  end

  def generate_hash(text)
    hash = Hash.new
    strings_array = generate_array(text)

    strings_array.each do |c|
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
# Output: {:d=>1, :e=>1, :h=>1, :l=>3, :o=>2, :r=>1, :w=>1}

p test_default_chars_with_case.to_hash
# Output: {:E=>1, :H=>1, :L=>2, :O=>1, :W=>1, :d=>1, :l=>1, :o=>1, :r=>1}

p test_default_chars_with_special.to_hash
# Output: {:!=>1, :d=>1, :e=>1, :h=>1, :l=>3, :o=>2, :r=>1, :w=>1}

p test_default_chars_with_both.to_hash
# Output: {:!=>1, :E=>1, :H=>1, :L=>2, :O=>1, :W=>1, :d=>1, :l=>1, :o=>1, :r=>1}

p words_default.to_hash
# Output: {:craig=>2, :hello=>1, :i=>1, :is=>2, :mean=>1, :my=>2, :name=>2, :world=>2}

p words_case_sensitive.to_hash
# Output: {:CRAIG=>1, :Craig=>1, :HELLO=>1, :I=>1, :My=>1, :World=>2, :is=>2, :mean=>1, :my=>1, :name=>2}

p words_special_chars.to_hash
# Output: {:"craig."=>1, :"craig...my"=>1, :hello=>1, :i=>1, :is=>2, :mean=>1, :my=>1, :name=>2, :world!=>2}

p words_with_both.to_hash
# Output: {:"CRAIG."=>1, :"Craig...my"=>1, :HELLO=>1, :I=>1, :My=>1, :World!=>2, :is=>2, :mean=>1, :name=>2}


zelda_dameron_text = ""
File.open("zelda_dameron.txt") do |file|
  zelda_dameron_text = file.read
end

zelda_dameron_textogram = Textogram.new(zelda_dameron_text, false, false, true)

puts zelda_dameron_textogram.to_s