# What is the block's return value in the following code? Why?

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# The block's return value will be 1, nil, nil. The first iteration will return
# 1 as it is not great than itself. The remaning iterations return nil because
# `puts` always evaluates to nil.

# => [1, nil, nil]
