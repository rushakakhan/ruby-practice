print "Input your first and last name: "

input = gets.chomp
name_arr = input.split(" ")
first = name_arr.first
last = name_arr.last

puts "Hello #{last} #{first}"
