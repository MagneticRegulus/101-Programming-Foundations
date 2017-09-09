# Given this code, what would be the final values of a and b? Try to work this
# out without running the code.

a = 2
b = [5, 8]
arr = [a, b] # => [2, [5, 8]]

arr[0] += 2 # => [4, [5, 8]] # a is not updated
arr[1][0] -= a # => [4, [1, 8]] # wrong [4, [3, 8]] # b is updated

# a is 4
# b is [1, 8] # wrong, this will be [3, 8]

p a
p b
p arr
