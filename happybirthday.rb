print "What's your name? "

name = gets.chomp
happy_string = "Happy birthday"

count = 1
until count > 4
  case count
  when 3
    puts "#{happy_string} dear #{name}"
  else
    puts happy_string + " to you"
  end
  count += 1
end
