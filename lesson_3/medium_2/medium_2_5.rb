def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

# Remove the unnecessary duplication - remove the if/else statement, include
# only the conditional requiring review

def color_valid(color)
  color == 'blue' || color == 'green'
end

p color_valid('orange')
p color_valid('yellow')
p color_valid('blue')
p color_valid('green')
