# Using the each method, write some code to output all of the vowels from the strings.

hsh = {
  first: ['the', 'quick'],
  second: ['brown', 'fox'],
  third: ['jumped'],
  fourth: ['over', 'the', 'lazy', 'dog']
}

hsh.each do |_, strings|
  strings.each do |word|
    word.chars.each { |chr| puts chr if chr =~ /[aeiou]/i }
  end
end

puts "---"
# also

hsh.values.each do |strings|
  strings.each do |word|
    word.chars.each { |chr| puts chr if chr =~ /[aeiou]/i }
  end
end
