# How does take work? Is it destructive? How can we find out?

arr = [1, 2, 3, 4, 5]
arr.take(2)

# Can find out by reading the ruby docs:
# https://ruby-doc.org/core-2.3.1/Array.html#method-i-take

# `Array#take` is non-destructive as it will return a new array. It returns the
# first n elements from the array into this new array. In this case, n == 2.
# => [1, 2]
