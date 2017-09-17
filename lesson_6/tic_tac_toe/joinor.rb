def joinor(ary, punc=', ', conj='or')
  if ary.size <= 1
    ary[0].to_s
  elsif ary.size == 2
    "#{ary[0..-2].join(punc)}#{' ' + conj} #{ary[-1]}"
  else
    "#{ary[0..-2].join(punc)}#{punc + conj} #{ary[-1]}"
  end
end



p joinor([1]) == "1"
p joinor([1, 2]) == "1 or 2"
p joinor([1, 2, 3]) == "1, 2, or 3"
p joinor([1, 2, 3], '; ') == "1; 2; or 3"
p joinor([1, 2, 3], ', ', 'and') == "1, 2, and 3"
p joinor([]) == ''

puts '-------'

# Refactored from the solution a little bit:

def joinor(ary, punc=', ', conj='or')
  if ary.size <= 1
    ary.first.to_s
  elsif ary.size == 2
    ary.join(" #{conj} ")
  else
    "#{ary[0..-2].join(punc)}#{punc + conj} #{ary.last}"
  end
end

p joinor([1]) == "1"
p joinor([1, 2]) == "1 or 2"
p joinor([1, 2, 3]) == "1, 2, or 3"
p joinor([1, 2, 3], '; ') == "1; 2; or 3"
p joinor([1, 2, 3], ', ', 'and') == "1, 2, and 3"
p joinor([]) == ''
