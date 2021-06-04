fun_nouns = []
adjectives = []
official_nouns = []

File.open("nouns.txt") do |file|
  fun_nouns = file.readlines
end

File.open("adjectives.txt") do |file|
  adjectives = file.readlines
end

File.open("organizations.txt") do |file|
  official_nouns = file.readlines
end

official_noun_index = rand(official_nouns.length)
fun_noun_index = rand(fun_nouns.length)
rand_adj_index = rand(adjectives.length)

official_noun = official_nouns[official_noun_index].chomp
fun_noun = fun_nouns[fun_noun_index].chomp
adj = adjectives[rand_adj_index].chomp

puts "We will call outselves 'The #{adj} #{official_noun} of #{fun_noun}s'!"

input = ""
until input.downcase == "yes" || input.downcase == "no"
  puts "Is that too official sounding?"
  input = gets.chomp
end

unless input.downcase == "no"
  puts "Okay how bout this:"
  puts "#{adj} #{fun_noun} #{official_noun}"
end



