# Shorten this sentence:

advice = "Few things in life are as important as house training your pet dinosaur."

# ...remove everything starting from "house".

# Review the String#slice! documentation, and use that method to make the return
# value "Few things in life are as important as ". But leave the advice variable as
# "house training your pet dinosaur.".

p advice.slice!("Few things in life are as important as ")

p advice

# As a bonus, what happens if you use the String#slice method instead?

# It does not mutate the caller. It only returns the given string if it exists in the
# string but returns a new string.

# reset
advice = "Few things in life are as important as house training your pet dinosaur."

p advice.slice("Few things in life are as important as ")

p advice

# Solution

advice = "Few things in life are as important as house training your pet dinosaur."

p advice.slice!(0, advice.index('house'))

p advice
