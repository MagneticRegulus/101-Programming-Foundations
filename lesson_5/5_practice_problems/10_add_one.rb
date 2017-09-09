# Given the following data structure and without modifying the original array,
# use the map method to return a new array identical in structure to the original
# but where the value of each integer is incremented by 1.

hsh_ary = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

new_ary = hsh_ary.map(&:to_a).map do |hash|
  hash.map { |pair| pair.map { |e| e.to_s.to_i == e ? e + 1 : e }}.to_h
end

p new_ary
p hsh_ary

# solution:

[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
  incremented_hash = {}
  hsh.each do |key, value|
    incremented_hash[key] = value + 1
  end
  incremented_hash
end

# another not using #map

[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].each_with_object([]) do |hsh, arr|
  incremented_hash = {}
  hsh.each do |key, value|
    incremented_hash[key] = value + 1
  end
  arr << incremented_hash
end
