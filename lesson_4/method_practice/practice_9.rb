# What is the return value of map in the following code? Why?

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# => [nil, 'bear']
# `Enumerator#map` returns a new array with the result of the block at each iteration.
# There are 2 key-value pairs. The conditional looks for only values with a character
# length greater than 3.

# map will always return something at each iteration, however, so the first iteration
# will return `nil`.
