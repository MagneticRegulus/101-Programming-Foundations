# Given this nested hash,figure out the total age of just the male members of
# the family.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_mens_age = 0

munsters.each do |k, v|
  total_mens_age += v['age'] if v['gender'] == 'male'
end

p total_mens_age
puts "It should be #{32 + 402 + 10}"

# solution version, very similar, uses a slightly different method as none of
# the outer hash's keys are used
total_mens_age = 0

munsters.each_value do |info|
  total_mens_age += info['age'] if info['gender'] == 'male'
end


p total_mens_age
puts "It should be #{32 + 402 + 10}"
