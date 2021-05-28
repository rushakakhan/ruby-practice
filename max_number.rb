# Ruby Problem Solving: Max Number Problem

# Prompt the user for 1st number
print "Enter a number: "
first = gets.chomp

# Check if entered string contains digit, if not prompt user
while first[/\d/].nil?
  print "You must enter an integer: "
  first = gets.chomp
end

# Once digit is entered convert string to integer
first = first.to_i

# Prompt the user for 2nd number
print "Enter another number: "
second = gets.chomp

# Check if entered string contains digit, if not prompt user
while second[/\d/].nil?
  print "You must enter an integer: "
  second = gets.chomp
end

# Once digit is entered convert string to integer
second = second.to_i

# Print max message
puts "Max: #{first > second ? first : second}"
