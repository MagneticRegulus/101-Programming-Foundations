# Programmatically determine if 42 lies between 10 and 100.

puts (10..100).include?(42) # => true

# (11..100) might be slightly more accurate (don't want to include 10 as a possibility)

# can also do

puts (10...100).cover?(42) # most correct
