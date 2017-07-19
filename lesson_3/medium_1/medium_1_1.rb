# For this practice problem, write a one-line program that creates the following
# output 10 times, with the subsequent line indented 1 space to the right:

# The Flintstones Rock!

# In my solution, you need to know the length of the string being printed
(21...31).each { |i| puts 'The Flintstones Rock!'.rjust(i) }

# Solution
10.times { |number| puts (' ' * number) + 'The Flintstones Rock!' }

# much more elegant than mine!
