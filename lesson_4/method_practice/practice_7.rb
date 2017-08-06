# What is the block's return value in the following code? How is it determined?
# Also, what is the return value of any? in this code. What gets output by this code?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# Block's return: true, false, true
# This is determined by the last evaluated expression in the block, which is
# `num.odd?`. 2 of the 3 elements return true.

# Method's return: true
# Output:
# 1
# 2
# 3

# Output is incorrect. The method will stop iterating as soon as the block evaluates
# to true as the criteria for the method to return true is fully met.
# Output will simply be 1. 
