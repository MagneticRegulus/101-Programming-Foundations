# "Take your pick. Do you like << or + for modifying the buffer?".
# Is there a difference between the two, other than what operator she chose to
# use to add an element to the buffer?

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# rolling_buffer1 does the job she wants as it mutates the original buffer array.
# the array will continue to have new elements added with the old elements removed

# rolling_buffer2 does not mutate the original buffer array. Line 12 above
# assigns the buffer variable to the buffer plus the new element. The original
# array is not changed and the new element is discarded after each iteration

# proof:

buffer_array = [1, 2, 3, 4, 5]
(6..17).each { |i| p rolling_buffer1(buffer_array, 10, i) }
puts '------'
buffer_array = [1, 2, 3, 4, 5]
(6..17).each { |i| p rolling_buffer2(buffer_array, 10, i) }
