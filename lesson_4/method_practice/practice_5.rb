# What does shift do in the following code? How can we find out?

hash = { a: 'ant', b: 'bear' }
hash.shift

# Can discover the answer by reading the ruby docs for this method:
# https://ruby-doc.org/core-2.3.1/Hash.html#method-i-shift

# `Hash#shift` removes (mutates) a key-value pair at the hash's index 0.
# The method returns an array of the removed key-value pair, which is:
# => [:a, 'ant']
