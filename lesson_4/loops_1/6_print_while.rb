# Using a while loop, print 5 random numbers between 0 and 99. The code below
# shows an example of how to begin solving this exercise.

# numbers = []

# while <condition>
   # ...
# end

iteration = 1

while iteration < 6
  puts rand(0..99)
  iteration += 1
end

puts '=====OR====='

5.times { puts rand(0..99) }
