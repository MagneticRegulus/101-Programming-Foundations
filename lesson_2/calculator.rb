# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

# answer = Kernel.gets() - Syntax we will use in this program
# Kernel.puts(answer) - Syntax we will use in this program

Kernel.puts("Welcome to Calculator!")

Kernel.puts("What's the first number?")
number1 = Kernel.gets().chomp()

Kernel.puts("What's the second number?")
number2 = Kernel.gets().chomp()

Kernel.puts("What operation would you like to perform? 1) add 2) subtract 3) multiply 4) divide")
operator = Kernel.gets().chomp()

if operator == '1'
  result =  number1.to_i() + number2.to_i()
elsif operator == '2'
  result =  number1.to_i() - number2.to_i()
elsif operator == '3'
  result =  number1.to_i() * number2.to_i()
else
  result =  number1.to_f() / number2.to_f() # to return decimals
end

Kernel.puts("The result is #{result}")

# Things to take out of this assignment:

# 1. In conditionals, make sure to use equality == not assignment =
# 2. Pay attention to comparator objects; 1 vs '1' are quite different
# 3. Understand the concept of integer division
# 4. Understand the limitations of `.to_i` and `.to_f` - read the Ruby docs
# 5. Local variables initialized withing an `if...end` can be accessed outside of the statement
# 6. `if` expressions can return a value:

# result = if true
#          'yes'
#        else
#          'no'
#        end

# Kernel.puts(answer) # => yes
