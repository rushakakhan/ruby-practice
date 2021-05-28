# Get My Number Game
# Written by: Craig Rushon

puts "Welcome to 'Get My Number!'"

# Get the players name, save to variable, and add greeting
print "What's your name? "
name = gets.chomp
puts "Welcome, #{name}!"

# Communicate rules of the game
puts "I've chosen a number between 1 and 100. Try and guess what it is! You have 10 guesses..."

# Save random number between 1 - 100
number = rand(100) + 1
guess_count = 0 


until guess_count == 10
  print "Take a guess (any number between 1-100): "
  guess = gets.chomp.to_i
  guess_count += 1

  if guess < number
    puts "You guessed too LOW"
  elsif guess > number
    puts "You guessed too HIGH"
  else 
    puts "WEOOO you guessed right, #{name}!"
    puts "That only took #{guess_count} guesses!"
    return
  end
end

puts "Looks like you ran out of guesses.", "The number was: #{number}"