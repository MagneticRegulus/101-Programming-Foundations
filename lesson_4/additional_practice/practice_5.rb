# In the array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# Find the index of the first name that starts with "Be"

be_names = flintstones.select { |name| name.start_with?('Be') }
p flintstones.index(be_names[0])

# solution:

p flintstones.index { |name| name[0, 2] == "Be" }

# =====or=====

p flintstones.index { |name| name.start_with?('Be') }
