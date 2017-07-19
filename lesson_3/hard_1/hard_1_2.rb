# What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# the variable mutated in line 5 was not the value of the :a key, but the string
# object 'hi'. 'hi' is assigned to a new variable in line 4, and it is this new variable
# or object that is mutated in line 5

# incorrect
# => {:a=>'hi there'} - `informal_greeting` is a reference to the original object
# which is then mutated.

# from the solution
# we could initialize informal_greeting with a reference to a new object containing
# the same value by informal_greeting = greetings[:a].clone.
# we can use string concatenation, informal_greeting = informal_greeting + ' there',
# which returns a new String object instead of modifying the original object.
