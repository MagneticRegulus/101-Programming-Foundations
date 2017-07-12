# In an earlier practice problem we saw that depending on variables to be modified
# by called methods can be tricky:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# We learned that whether the above "coincidentally" does what we think we wanted
# "depends" upon what is going on inside the method.

# How can we refactor this practice problem to make the result easier to predict
# and easier for the next programmer to maintain?

# update the name of the array to something more meaningful.
# rather than assigning the string (which does not mutate the parameter), I would
# use a concat method (<<) at the string level.

def append_rutabaga!(a_string_param, an_array_param)
  a_string_param << "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
append_rutabaga!(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# The name change and the concat method better explains to the programmer what
# the method does, and also does it more consistently across the 2 functions of
# the method. This can actually be written as one method instead:

def append_rutabaga!(string_or_array)
  string_or_array << "rutabaga"
end

# Solution version:
def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
