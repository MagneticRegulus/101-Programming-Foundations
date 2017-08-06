# What is the return value of the following statement? Why?

['ant', 'bear', 'caterpillar'].pop.size

# => 11

# `Array#pop` removes (mutates) the last element of the array ('caterpillar') and
# returns it. `Array#size` evaluates the returned value ('caterpillar') and returns
# the character length of the string (not the array).
