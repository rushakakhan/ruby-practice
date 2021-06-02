lines = []

File.open("reviews.txt") do |review_file|
  lines = review_file.readlines
end

relevant_lines = lines.find_all { |line| line.include?("Truncated") }

relevant_lines = relevant_lines.reject { |line| line.include?("--") }

puts relevant_lines