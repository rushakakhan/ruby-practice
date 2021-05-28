print "What's your name? "

name = gets.chomp
happy_string = "Happy birthday"

count = 1
while count <= 4
  if count == 3
    puts "#{happy_string} dear #{name}"
  else
    puts happy_string + " to you"
  end
  count += 1
end
