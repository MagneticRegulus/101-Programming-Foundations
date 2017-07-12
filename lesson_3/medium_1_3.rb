# Alan wrote the following method, which was intended to show all of the factors
# of the input number:

def factors(number)
  dividend = number
  divisors = []
  begin
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end until dividend == 0
  divisors
end

# Alyssa noticed that this will fail if the input is 0, or a negative number,
# and asked Alan to change the loop. How can you change the loop construct
# (instead of using begin/end/until) to make this work?

def factors(number)
  dividend = number
  divisors = []
  while dividend > 0 # change
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end # change
  divisors.empty? ? 'No Factors' : divisors # my change
end

p factors(0)
p factors(-2)
p factors(6)
p factors(36)
p factors(496)

# Bonus - if number % dividend == 0 verfies what the factors of number are; if
# the anser is anything other than 0, it's not a factor.

# Bonus 2 - divisors returns the divisors array; this is the value the method
# returns, an array with the factors of number
