# Add up all of the ages from the Munster family hash:

ages = {
  "Herman" => 32,
  "Lily" => 30,
  "Grandpa" => 5843,
  "Eddie" => 10,
  "Marilyn" => 22,
  "Spot" => 237
}

total_age = 0
ages.each { |_, v| total_age += v }
p total_age

more_total_age = 0
ages.values.each { |age| more_total_age += age }
p more_total_age

# from solution:

p ages.values.inject(:+)
