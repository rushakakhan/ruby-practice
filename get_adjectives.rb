lines = []

File.open("reviews.txt") do |review_file|
  lines = review_file.readlines
end

relevant_lines = lines.find_all { |line| line.include?("Truncated") }

relevant_lines = relevant_lines.reject { |line| line.include?("--") }

def get_adjective(string)
  words = string.split(" ")
  index = words.find_index("is")
  words[index + 1]
end

adjectives = relevant_lines.map { |line| get_adjective(line) }

puts adjectives