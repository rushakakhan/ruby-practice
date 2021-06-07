first = rand(6) + 1
second = rand(6) + 1
third = rand(6) + 1
fourth = rand(6) + 1

##code = first.to_s + second.to_s + third.to_s + fourth.to_s
puts "Mastermind"

code = "1234"

guesses = 1

print "[#{guesses}] Enter your guess: "
input = gets.chomp

until input == code
  guess_arr = input.split("")
  code_arr = code.split("")
  output = ""
  matches = []
  guesses += 1

  guess_arr.each_with_index do |guess, index|
    guess_index = code_arr.index(guess)
    if guess_index == index && matches.include?(guess) == false
      output += "X"
      matches << guess
    elsif guess_index && matches.include?(guess) == false
      output += "x"
      matches << guess
    end
  end

  puts output
  print "[#{guesses}] Enter your guess: "

  input = gets.chomp
end

puts input
puts "Nice work! You took #{guesses} #{guesses > 1 ? "guesses." : "guess."}"
