file_name = ARGV[0]

file_lines = []
File.open("#{file_name}") do |file|
  file_lines = file.readlines
end

method_names = []
file_lines.each do |line|
  if line.include?(" def ") && !line.include?("initialize")
    method_names << line.strip.split(" ").last.split("(").first
  end
end

#p method_names

file_string = file_name.split("/").last
file_words = file_string.gsub(".rb", "").split("_")
class_name = ""
file_words.each { | word| class_name << word.capitalize }

new_file = %Q(require 'minitest/autorun'
require '#{file_string.gsub(".rb", "")}'

class Test#{class_name} < Minitest::Test

  def setup

  end
)

method_names.each do |method|
  new_file << %Q(
  def test_#{method}

  end

  )
end

new_file << "end"

#puts new_file

File.open("test_#{file_string}", 'w') do |file|
  file.write(new_file)
end



