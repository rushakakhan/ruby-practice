change = "Let's go"
count = 0
coin_strings = {
  "toonie" => 0,
  "loonie" => 0,
  "quarter" => 0,
  "dime" => 0,
  "nickel" => 0
}

while change.to_f <= 0.0
  print "How much change is owed? "
  change = gets.chomp.to_f
end

if change < 0.03
  puts "You don't need to dispense any change."
else
  while change - 2 >= 0
    count += 1
    change -= 2
    coin_strings["toonie"] += 1 
  end

  while change - 1 >= 0
    count += 1
    change -= 1
    coin_strings["loonie"] += 1
  end

  while change - 0.25 >= 0
    count += 1
    change -= 0.25
    coin_strings["quarter"] += 1
  end

  while change - 0.10 >= 0
    count += 1
    change -= 0.1
    coin_strings["dime"] += 1
  end

  while change - 0.05 >= 0
    count += 1
    change -= 0.05
    coin_strings["nickel"] += 1
  end

  unless change.round(2) < 0.03
    count += 1
    coin_strings["nickel"] += 1
  end

  coin_string = ""
  coin_strings.each do |key, value|
    next if value == 0
    coin_string += "#{value}"
    coin_string += " #{key}"
    coin_string += "s" if value > 1
    coin_string += "," unless key == "nickel"
  end

  string_arr = coin_string.split(",")
  unless count == 1 || string_arr.length == 1
    string_arr[string_arr.length - 1] = "and #{string_arr.last}"
  end

  print "You need to dispense "
  puts string_arr.join(", ") + "."
end
puts "Total coins: #{count}"