file_name = ARGV[0]
N = 10
file_line_buffer = []

File.open("#{file_name}") do |file|
  file.each do |line|
    file_line_buffer.shift if file_line_buffer.size == N
    file_line_buffer << line
  end
end

file_line_buffer.each { |line| puts line }

