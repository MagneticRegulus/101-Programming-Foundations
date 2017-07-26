# Use next to modify the code so that the loop iterates until either number_a or
# number_b equals 5. Print "5 was reached!" before breaking out of the loop.

# number_a = 0
# number_b = 0

# loop do
#   number_a += rand(2)
#   number_b += rand(2)

#   break
# end

number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  puts "A is #{number_a}" # added for testing
  number_b += rand(2)
  puts "B is #{number_b}" # added for testing
  next if number_a < 5 && number_b < 5
  puts '5 was reached!'
  break
end
