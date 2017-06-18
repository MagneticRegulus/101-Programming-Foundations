# Using Ruby syntax...not using an iterator variable

def find_greatest(numbers)
  saved_number = nil

  numbers.each do |num|
    saved_number ||= num # assign to first value
    if saved_number >= num
      next
    else
      saved_number = num
    end
  end

  saved_number
end

numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 3, 2, 1] # my code

puts find_greatest(numbers) # my code

# possible improvements:
# could add a check to the beginning of the method to guard against nil or empty arrays:

# return if numbers.nil? || numbers.empty?

# remove check to see if saved_number is nil at every iteration

# saved_number = numbers.first
