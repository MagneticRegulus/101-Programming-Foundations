# How can we add the family pet "Dino" to our usual array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# 1
flintstones.push('Dino')

# 2
flintstones << 'Dino' # solution

# 3
flintstones.insert(-1, 'Dino')

# 4 (Given in the next challenge)

flintstones.concat(['Dino'])

p flintstones
