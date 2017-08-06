# What is the return value of the select method below? Why?

[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# => [1, 2, 3]
# This occurs because 'hi' is truthy. Every iteration will evaluate to true
# so every iteration will choose the current element.
