print "Enter a number: "

input = gets.chomp.to_i

for i in 1..input
  for j in 1..i
    print "*"
  end
  print "\n"
end
