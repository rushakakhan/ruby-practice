def customized_list_of_multiples(multiples_of, size)
  multiples = []
  counter = 1
  size.to_i.times do 
    multiples << multiples_of * counter
    counter += 1
  end

  if block_given?
    multiples = yield multiples
  end

  return multiples
end

puts customized_list_of_multiples(3, 7)

double_up = customized_list_of_multiples(2, 8) do |array|
  array.map { |num| num * 2 }
end

string_it_up = customized_list_of_multiples(2, 8) do |array|
  array.map { |num| num.to_s }
end

p double_up, string_it_up