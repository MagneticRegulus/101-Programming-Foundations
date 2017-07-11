# In the previous practice problem we added Dino to our array like this:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# flintstones << "Dino"

# We could have used either Array#concat or Array#push to add Dino to the family.

# How can we add multiple items to our array? (Dino and Hoppy)

pets = %w(Dino Hoppy)

flintstones.concat(pets)

# solution examples

flintstones.push("Dino").push("Hoppy")   # push returns the array so we can chain

# or

flintstones.concat(%w(Dino Hoppy))  # concat adds an array rather than one item
