# How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']

p arr.sort_by { |a, b| b.to_i <=> a.to_i  } # wrong, figured this out quickly

# possible solutions:
p arr.sort { |a, b| b.to_i <=> a.to_i  } # correct
p arr.sort_by { |num| num.to_i  }.reverse # correct
