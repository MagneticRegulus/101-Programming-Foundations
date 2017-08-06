# What is the return value of reject in the following code? Why?

[1, 2, 3].reject do |num|
  puts num
end

# => [1, 2, 3]

# All elements of the array have been rejected as all iterations will evaluate
# to false. This is due to the fact that #puts will will allows return `nil`.

# `nil` is falsey. At each iteration, the block evaluates to nil == falsey => true
