# What happens when we modify an array while we are iterating over it? What would
# be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# Output unexpected behaviour:
# 1
# 3
# => [3, 4]
# each iterates by looking at the indexes...or at the current length of array


# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# Output
# 1
# 2
# => [1, 2]

# same as above

# operate on the original array in real time
