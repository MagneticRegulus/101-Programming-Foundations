# Modify the following code so that the loop stops if number is between 0 and 10.

# loop do
#   number = rand(100)
#   puts number
# end

loop do
  number = rand(100)
  puts number
  break if number <= 10
end

puts '=====OR====='

loop do
  number = rand(100)
  puts number
  break if number.between?(0, 10)
end
