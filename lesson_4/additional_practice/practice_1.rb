# Given the array below

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# Turn this array into a hash where the names are the keys and the values are the
# positions in the array.

new_hash = flintstones.each_with_object({}) do |element, hash|
             hash[element] = flintstones.index(element)
           end

p new_hash

# =====OR======

newer_hash = {}

flintstones.each_with_index do |element, index|
  newer_hash[element] = index
end

p newer_hash
