calc_payment = Proc.new do |total| 
  amort = 25
  i = 0.0189 / 12
  n = 12 * amort 
  total * (i * (1 + i)**n) / ((1 + i)**n - 1)
end

puts_payment = Proc.new do |total| 
  amort = 25
  i = 0.0189 / 12
  n = 12 * amort 
  puts format( "Monthly payment: $%.2f", (total * (i * (1 + i)**n) / ((1 + i)**n - 1)))
end

mortgages = [299000, 270000, 220000, 250000]

payments = mortgages.sort.map(&calc_payment)
mortgages.sort.each(&puts_payment)

p payments

