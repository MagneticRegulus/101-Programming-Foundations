# Starting with the string:

famous_words = "seven years ago..."

# show two different ways to put the expected "Four score and " in front of it.

# 1
famous_words = "Four score and " << famous_words

puts famous_words

#reset
famous_words = "seven years ago..."

# 2
famous_words.insert(0, "Four score and ")

puts famous_words

# reset
famous_words = "seven years ago..."

# 3 - interpolation...does not reset variable
puts "Four score and #{famous_words}"

# 4
famous_words = "Four score and " + famous_words

puts famous_words

#reset
famous_words = "seven years ago..."

# Another solution, easier to understand than insert
famous_words.prepend("Four score and ")

puts famous_words
