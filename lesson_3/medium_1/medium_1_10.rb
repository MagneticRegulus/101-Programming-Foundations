# Consider these two simple methods:

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

# What would be the output of this code:

bar(foo)

# This would output 'no'. the foo method will always have a default output of
# 'yes'. When passed to `bar`, it will overwrite the default parameter, and therefore
# `bar(foo)` will output to 'no' because the parameter does not equal 'no'.
