# Given the array of several numbers below, use an until loop to print each number.

numbers = [7, 9, 13, 25, 18]

until numbers.empty?
  puts numbers.shift
end

# This is destructive which might not be the intent of the exercise.

# also doable on one line

puts '=====OR====='

numbers = [7, 9, 13, 25, 18]

puts numbers.shift until numbers.empty?
