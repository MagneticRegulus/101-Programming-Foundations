# What is the return value of each_with_object in the following code? Why?

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# => {'a' => 'ant', 'b' => 'bear', 'c' => 'cat'}

# The block returns a new object (a hash in this case). Each key-value pair is
# being set with each iteration. The value of `value[0]` is the character at index
# 0 of each string element. This is the key. The value is set as itself. 
