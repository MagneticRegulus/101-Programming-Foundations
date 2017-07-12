# What is the output of the following code?

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# => 34.

# The answer variable was not mutated by the method call. The method call
# returned a new integer which was assigned to new_answer
