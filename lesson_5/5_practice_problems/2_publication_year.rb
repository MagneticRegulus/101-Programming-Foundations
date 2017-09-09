# How would you order this array of hashes based on the year of publication of
# each book, from the earliest to the latest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

p books.sort_by { |book| book[:published].to_i }

# The solution does not include the #to_i method as all values of :published are
# 4 characters in length. Sorting by the string representation of the year will
# work. However, I personally feel that when working with numbers and sorting
# it's good to remember that sorting string is different from sorting integers
