file_name = ARGV[0]

file_lines = []

File.open("#{file_name}") do |file|
  file_lines = file.readlines
end

uppercase_lines = file_lines.map { |line|  line.upcase }

new_file = ""
uppercase_lines.each do |line|
  new_file << line
end

File.open("uppercase_#{file_name}", "w+") do |file|
  file.write(new_file)
end

puts "File saved successfully.\nNew file name: 'uppercase_#{file_name}'."

