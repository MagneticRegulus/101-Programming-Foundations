def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}" # => 'pumpkins'
puts "My array looks like this now: #{my_array}" # => ['pumpkins', 'rutabaga']

# line 2 does not implicitly return the NEW string, and it does not mutate the caller
# therefore it does not change from the first method.

# line 3, however, mutates the caller, and therefore the original variable is altered
