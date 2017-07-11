Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

1. what is != and where should you use it?

`!=` is a conditional which returns true if the item to the right of it is not equal to the item to the left. It will return false if the item to the right is equal to the item on the left.

```ruby
2 != 3 # => true
2 != 2 # => false
```

2. put ! before something, like !user_name

This will evaluate to `false`. (actually opposite of the boolean equivalent)

```ruby
user_name = 1
1 == user_name # => true
!user_name # => false
1 == !user_name # => false; 1 does not equal false
false == !user_name # => true
1 != !user_name # => true
```

3. put ! after something, like words.uniq!

When appended to a method name, this indicates that the method mutates the caller. However, the method has to be pre-defined this way; you cannot simply add ! to the end of any method.

```ruby
words = %w(dog cat cat ferret)
words.uniq # => ["dog", "cat", "ferret"]
p words # => ["dog", "cat", "cat", "ferret"]
words.uniq! # => ["dog", "cat", "ferret"]
p words # => ["dog", "cat", "ferret"]
```

4. put ? before something

This can indicate a ternary expression. Or it can be used to represent a single charater string. the single charater following is the string.

`?a #=> 'a'`

5. put ? after something

This can indicate that the method being called will return either `true` or `false`.

```ruby
1.odd? # => true
1.even? # => false
2.odd? # => false
2.even? # => true
```

6. put !! before something, like !!user_name

This will evaluate to `true.` (actually boolean equivalent)

```ruby
user_name = 1
1 == user_name # => true
!!user_name # => true
1 == !!user_name # => false; 1 does not equal true
false == !!user_name # => false
1 != !!user_name # => true; 1 does not equal true
```
