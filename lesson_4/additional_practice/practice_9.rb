# This method in Ruby on Rails creates a string that has each word capitalized as
# it would be in a title. For example, the string:

words = "the flintstones rock"
# would be:

# words = "The Flintstones Rock"
# Write your own version of the rails titleize implementation.

def titleize(string)
  string.split(' ').map { |word| word.capitalize }.join(' ')
end

p words
p titleize(words)
p words
words = titleize(words)
p words
