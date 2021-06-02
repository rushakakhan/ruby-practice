puts "Rock Paper Scissors"

print "Player 1 - Enter your selection: "

player1 = gets.chomp.capitalize

print "Player 2 - Enter your selection: "

player2 = gets.chomp.capitalize

if player1 == player2
  puts "Tie!"
  return
end

case player1
when "Rock"
  case player2
  when "Scissors"
    puts "Rock crushes scissors."
    puts "Player 1 wins!"
  when "Paper"
    puts "Paper covers rock."
    puts "Player 2 wins!"
  else
    puts "No cheaters! Only Rock, Paper or Scissors are allowed."
  end
when "Scissors"
  case player2
  when "Rock"
    puts "Rock crushes scissors."
    puts "Player 2 wins!"
  when "Paper"
    puts "Scissors cuts paper."
    puts "Player 1 wins!"
  else
    puts "No cheaters! Only Rock, Paper or Scissors are allowed."
  end
when "Paper"
  case player2
  when "Scissors"
    puts "Scissors cuts paper."
    puts "Player 2 wins!"
  when "Rock"
    puts "Paper covers rock."
    puts "Player 1 wins!"
  else
    puts "No cheaters! Only Rock, Paper or Scissors are allowed."
  end
else
  puts "No cheaters! Only Rock, Paper or Scissors are allowed."
end
