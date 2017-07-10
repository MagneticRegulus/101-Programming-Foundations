# What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# prints: 1 2 2 3 (separate lines) because the `Array#uniq` method does not
# mutate the caller
