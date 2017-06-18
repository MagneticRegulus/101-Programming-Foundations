# Things to think about

# 1. Is there a better way to validate that the user has input a number? We'll
# cover this in more detail in a future assignment.

def valid_number?(num)
  num.to_i() != 0 || num == '0' # this also includes the option for receiving 0 as input
end

# 2. It looks like you can call to_i or to_f to convert strings to integers and
# floats, respectively. Look up the String#to_i and String#to_f documentation in
# Ruby docs and look at their various examples and use cases.

# .to_f never raises an exception b/c if there is not a valid number at the start of
# str, 0.0 is returned.

# .to_i never raises an exception unless base is invalid (same reason as above). This
# method can declare a different base (2 instead of base 10, etc.)

# 3. Our operation_to_message method is a little dangerous, because we're relying
# on the case statement being the last expression in the method. What if we needed to
# add some code after the case statement within the method? What changes would be needed
# to keep the method working with the rest of the program? We'll show a solution in an
# upcoming assignment.

def operation_to_message(op)
  op_verb = case op
            when '1'
              'Adding'
            when '2'
              'Subtracting'
            when '3'
              'Multiplying'
            when '4'
              'Dividing'
            end
  # include additional code here
  op_verb # could also say `return op_verb` to clarify confusion
end

# 4. Refer to the assignment https://launchschool.com/lessons/a0f3cd44/assignments/fcd8a299
# as it asks to practice removing some of the unnecessary parentheses.

# 5. We already know that in Ruby we can omit the parentheses, but how come we can also omit the Kernel.?

# puts and gets are module methods (not instant methods); These methods are called
# without a receiver and thus can be called in functional form. https://ruby-doc.org/core-2.3.1/Kernel.html

# 6. Could we move them into some configuration file and access by key?

# Yes. This would also allow you to update the config file for content changes rather than
# piddling around in the actual program code.
