# The result of the following statement will be an error:

# puts "the value of 40 + 2 is " + (40 + 2)

# Why is this and what are two possible ways to fix this?

# b/c (40 + 2) = 42 which is an integer, not a string; it cannot be concatenated

# fix 1
puts "the value of 40 + 2 is " + (40 + 2).to_s

# fix 2
puts "the value of 40 + 2 is #{40 + 2}"
