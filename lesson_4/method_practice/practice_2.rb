# How does count treat the block's return value? How can we find out?

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# Array#count will always return an integer. In this case, the method will return
# the number of elements which meet the criteria in the block.
# => 2

# This information can be located in the ruby docs:
# https://ruby-doc.org/core-2.3.1/Array.html#method-i-count

# The method considers the 'truthiness' of the block's return value
