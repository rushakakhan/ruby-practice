print "Enter a year: "

input = gets.chomp

while input[/\d/].nil? || input.to_i < 0
  puts "#{input} is not a valid year"
  print "Enter a year: "
  input = gets.chomp
end

if input.to_i % 4 != 0
  puts "#{input} is not a leap year"
elsif input.to_i % 100 != 0
  puts "#{input} is a leap year"
elsif input.to_i % 400 != 0
  puts "#{input} is not a leap year"
else
  puts "#{input} is a leap year"
end
