class Textogram

  def initialize(text, case_sensitive = false, include_special_chars = false)
    if text == ""
      raise "Text cannot be blank!"
    end
    @text = text
    @case_sensitive = case_sensitive
    @include_special = include_special_chars
    @char_hash = Hash.new
    @word_hash = Hash.new
  end

  def chars_to_hash
    if @char_hash.empty?
      generate_histogram(@text)
    end
    @char_hash
  end

  def words_to_hash
    if @word_hash.empty?
      generate_histogram(@text, true)
    end
    @word_hash
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

  def generate_histogram(text, for_words = false)
    hash = Hash.new
    text = text.gsub(/[^0-9A-Za-z]/, '') unless @include_special
    raise "No valid characters to work with." if text == ""
    text.downcase! unless @case_sensitive
    if for_words
      chars = text.split(" ").sort
    else
      chars = text.split("").sort
    end

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



