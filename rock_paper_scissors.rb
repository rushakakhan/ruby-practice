puts "Rock Paper Scissors"

valids = ["Rock", "Paper", "Scissors"]
resolved = false

until resolved
  print "Player 1 - Enter your selection: "
  player1 = gets.chomp.capitalize

  print "Player 2 - Enter your selection: "
  player2 = gets.chomp.capitalize

  unless valids.include?(player1) && valids.include?(player2)
    puts "No cheaters! Only Rock, Paper or Scissors are allowed."
    next
  end

  if player1 == player2
    puts "Tie!" 
    next
  end

  choices = [player1, player2]
  winner = nil

  case choices.sort
  when ["Paper", "Rock"]
    puts "Paper covers rock."
    winner = choices.index("Paper") + 1
    resolved = true
  when ["Paper", "Scissors"]
    puts "Scissors cuts paper."
    winner = choices.index("Scissors") + 1
    resolved = true
  when ["Rock", "Scissors"]
    puts "Rock crushes scissors."
    winner = choices.index("Rock") + 1  
    resolved = true
  end
end

puts "Player #{winner} wins!"
