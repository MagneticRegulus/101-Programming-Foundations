# What do you expect to happen when the greeting variable is referenced in the
# last line of the code below?

if false
  greeting = “hello world”
end

greeting

# nothing.`greeting` will return `nil`
# the variable `greeting` is by default 'truthy' meaning it will always evaluate
# to `true` unless otherwise explicitly stated

# the variable `greeting` only has a value when the `if` statement evaluates
# to true. However, false is not 'truthy', so the statement will never assign the
# variable to the string and will instead assign `nil`

# there is no output to the terminal when the program is run -> there was no error
