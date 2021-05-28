# Ruby Problem Solving: Rearrange the digits

print "Enter a number: "

num_string = gets.chomp

if num_string == "-0"
  puts num_string
  return
else
  while num_string != num_string.to_i.to_s
    print "Enter a number: "
    num_string = gets.chomp
  end
end

num_arr = num_string.split("").sort
new_num = ""
zero_count = 0

if num_arr.first == "-"
  is_negative = true
end

for i in num_arr
  if is_negative
    if i == "0"
      zero_count += 1
      next
    elsif zero_count > 0
      new_num = new_num + i + "0" * zero_count
      zero_count = 0
      next
    end
    new_num += i
  else
    new_num = i + new_num
  end
end

puts new_num
