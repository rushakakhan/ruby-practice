puts "Rock Paper Scissors"

valids = ["Rock", "Paper", "Scissors"]
resolved = false
winner = nil
choices = []
player1 = ""
player2 = ""

until resolved
  win_string = ""

  if winner == 2
    choices[0] = player2
    choices[1] = player1
  else
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

    choices[0] = player1
    choices[1] = player2
  end

  case choices
  when ["Paper", "Rock"]
    win_string = "Paper covers rock."
    winner = 1 unless winner == 2
  when ["Scissors", "Paper"]
    win_string = "Scissors cuts paper."
    winner = 1 unless winner == 2
  when ["Rock", "Scissors"]
    win_string = "Rock crushes scissors."
    winner = 1 unless winner == 2
  else
    winner = 2
    next
  end
  resolved = true
end

puts win_string
puts "Player #{winner} wins!"
