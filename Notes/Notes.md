101 Programming Foundations
==========================


----------

[TOC]


----------

Lesson 1: Preparations
--------------------------------

### 1.1 Active Learning
Launch School uses lots of video lectures in order to teach concepts. Treat these videos like a university lecture:

* Remove external distractions
* Take Notes
* Look up concepts you don't understand
* Afterwards, try articulating the concepts in your own words
* Visualise yourself in a physical classroom
* Review notes following the lecture to ensure you've captured the key concepts

### 1.2 Coding Vs. Programming
Coding is the act of writing the grammar or syntax of programs.
Programming is the act of building applications; this is what software devs get paid to do.

There are different types of programming. Application development or "Web Dev" is one of those types. Ruby is the syntax. 

----------

Lesson 2: Small Problems
-------------------------------------

### 2.1 Pseudo-Code
There are 2 layers to solving any problem:

1. The logical problem domain layer
2. The syntactical programming language layer

This can also be summarised as the **human logic** and **code syntax**. For the human element, use English sentences to describe the program you are building. For code syntax, use **Formal Pseudo-Code**:

| Keyword        | Meaning       |
| -------------- |---------------|
| START          | start of the program               |
| SET            | sets a variable for later use      |
| GET            | retrieve input from user           |
| PRINT          | displays output to user            |
| READ           | retrieve value from variable       |
| IF/ELSEIF/ELSE | show conditional branches in logic |
| WHILE          | show looping logic                 |
| END            | end of the program                 |

### 2.2 Flowcharts

Flowcharts (diagrams) also help to visualise and understand branching logic.

![Flowchart Components](http://d1b1wr57ag5rdp.cloudfront.net/images/flowchart_components.jpg)

![Flowchart Example](http://d1b1wr57ag5rdp.cloudfront.net/images/flowchart_largest.jpg)

### 2.3 Rubocop

Rubocop is a Ruby gem which when used will enforce standard Ruby syntax. Rubocop is a **Code Linter** -- it inspects code for logical errors. Rubocop can also inspect more than one file at once.

Use Rubocop in the terminal:
```
$ rubocop file_name.rb
```
It can display several types of warnings with the "cop" which found the offence:
| Letter | Meaning     |
| ------ | ----------- | 
| C      | Convention  |
| W      | Warning     |
| E      | Error       |
| F      | Fatal Error |
You can create a YAML config file in your project directory to specify which "cops" and "departments" you want to inspect your files. If no config file is saved to the project directory, Rubocop uses a default YAML file.

### 2.4 Debugging

Debugging requires a patient and systematic temperament. 

> Programming is dealing with a constant stream of broken things and learning to deal with those ill feelings.

Debugging starts at the **Stack Trace** -- the error message you receive when something goes wrong. Every language and library will have its own Stack Trace.

##### **Online Debugging Resources**
1. *Search Engine* -- search for error messages
	* Do not use terms specific to your machine (e.g. variables for directories)
	* Do not copy and paste the entire stack trace; take the relevant parts
	* Add the language name (Ruby) to the beginning of the search 
2. *Stack Overflow* -- a programmer community which is sometime worth searching in or posting to directly when your search runs dry
3. *Documentation* -- refer back to the language API (Ruby Docs)

##### **Steps to Debugging**
1. *Reproduce the error* -- being able to consistently reproduce the problem helps to isolate the root cause
2. *Determine the boundaries of the error* -- modify the data to get an idea of scope; this leads to a deeper understanding
3. *Trace the code* -- walk through the code line by line to narrow it down
4. *Understand the problem well* -- review each element of the affected code
5. *Implement a fix* -- fix 1 problem at a time
6. *Test the fix* -- make sure the code fixed the problem, looking back to step #2

##### **Techniques for Debugging**
1. *Line by Line* -- your most powerful ability as a programmer; most bugs come from overlooking details
2. *Rubber Duck Debugging* -- using an object as a sounding board; forced to explain and articulate the problem out loud
3. *Walking Away* -- load the problem into your brain and go do something else for a while
4. *Using Pry* -- a powerful REPL (it's also a Ruby gem)
	* add `require pry` to the begging of your Ruby program
	* insert `binding.pry` anywhere in your code to inspect the state of the program at that point
	* press `Ctrl + D` to continue program execution
	* enter `exit-program` to exit
5. *Using a debugger* -- gives functionality to more systematically walk through the code

### 2.5 Coding Tips
##### Dramatic Experience and Retaining Knowledge
* Programming isn't difficult, but requires repetition
* It can sometimes be easy to make mistakes if you have not been *burned* by them
* Spending time debugging, therefore, has a return on investment -- embrace the burns
##### Naming Things
* Choose descriptive variable and method names
* `p = gets.chomp` saves characters, but what is it?
* They are named for what they do/store
* Don't hardcode names (e.g. yes_and_no) as this will limit you in the future
* Exception: variables in small blocks will only have a scope which covers 1 - 2 lines
##### Naming Conventions
* Ruby is unusual because it allows for freedom in naming things such as being able to use either snake_case or CamelCase
* Use the Rubyist stule to make your code more legible
* **CamelCase** - for classes
* **UPPERCASE** - for constants
* **snake_case** - for everything
* Use Rubocop to help catch name convention issues
##### Mutating Constants
* Ruby allows this, but it should not be done
* CONSTANTS should be *immutable*
##### Methods
* Make sure methods do one thing and has limited responsibility
* Methods should be short (~10 lines)
* 15+ line methods are better to split into multiple methods (2 or 3)
* Don't display and return a *meaningful* value; the return value should not be the intent of the method (???) 
* Decide if the method should return a value without side effects or just perform side effects -- NOT both (`#rev` and `#rev!` are different methods which return different things
* Returning a value is implied
##### Methods Should Have the Same Abstraction Value
* You should be able to feed methods inputs in isolation ( like `irb`) and get an output
* Helps to compartmentalise your focus
* Methods are "what" to do, not "how" (e.g. deal, hit, or stay vs. iterate over)
##### Method Names Should Reflect Mutation
* Should not expect methods (which look like they mutate) to return a value (should not have used parentheses)
* Use method names to set expectations
* Help yourself remember what each method does by choosing impactful and meaningful names
* For methods which output values, preface the methods with `display_` or `print_`
* For methods which return `true` or `false`, append '?' to the name such as `#float?` or `#integer?`
* Use small methods like LEGO pieces!
* A method should do one thing, and its name should describe that one thing (mutate, output, or returns)
* Should be able to ascertain that a method called `total` returns a value and a method called `print_total` returns `nil`
* If there's a method called `total!`, there should be a side effect
* Refactor your code to reflect growing clarity
* If you find yourself constantly looking at a method's implementation, it's a sign it needs to be improved
##### Display Output
* Sometimes methods need to display things
* No mutation or returned valued
* Can make this clear by adding prefixes to to method names (e.g. `print_`, `say_`, `display_`)
##### Should a Method Return or Display?
* Understand if a method returns a value, has side effects, or both; **this is critical to writing organised code**.
* "Side effects" means there is either displaying something to the output or mutating an object

**Examples:**

```ruby
# displaying
def display (ar1, arg2)
	puts arg1 + arg2
end
# => nil

# mutating a passed-in array
def mutate_array(array)
	array << 1
end
# => updated array

# no side effects
def add(num1, num2)
	num1 + num2
end
# => new integer
```
If a method has side effects and a meaningful return value, it's a red flag. These kinds of methods are difficult to use in the future.

##### Truthiness
* Everything in Ruby is "truthy" except for `nil` and `false`
* The "truthiness" of `nil` is `false` (e.g. `if user_input = 2` evaluates to `true` or `false`, the `true` is implied)
* Assigning `=` will always evaluate to `true`; make sure to use `==` for your conditional
##### Using New Lines to Organise Code
* New lines are important visual queues.
* Making your code readable is important for others but also for yourself.
* The small code snippet below is roughly divided by: 1) variable initialisation, 2) user input and validation, and 3) using the variable.

```ruby
name = ''

puts 'Enter your name:'
loop do
	name = gets.chomp
	if name.empty?
		puts 'That is not a valid name.'
	else
		break
	end
end

puts "Welcome, #{name}!"
puts 'What would you like to do?'
```
##### Don't Mutate the Caller During Iteration

```ruby
words = %w(scooby doo on channel two)
# printing while iterating is typical in Ruby
words.each { |str| puts str}
# mutating elements while iterating is typical in Ruby
words.each { |str| str << '!' }
# mutating an entire collection causes unexpected behaviour
word.each { |str| word.delete(str) }
# => ["doo", "channel"] ; does not delete all elements
```
**Full stop -- don't do this!**

##### Don't Use Assignment in a Conditional
Bad Example:

```ruby
if variable = value_from_somewhere
	puts variable
end
```
It's not clear if the coder meant to use `==` of if they indeed meant to assign. This leads to a lack of confidence that this code line will work; it might look like a bug.

Good Example:

```ruby
variable = value_from_somewhere
if variable
	puts variable
end
```
Sometimes experienced Rubyists will use this to serve as some kind of loop termination. As a convention, if you must use this, wrap the assignment in parentheses to show or indicate that the assignment was purposeful.

Example using `Array#shift` which removes and returns the 1st element in an array:

```ruby
numbers = %w(1 2 3 4 5)
while (num = numbers.shift)
	puts num
end
```
The loop will exit when `num == nil`.
##### Use Underscore for Unused Parameters
When you want to do something for each element, and you either don't care about the actual elements or when you only want to use 1 parameter, use an underscore:

```ruby
names %w(kim joe sam)
names.each {|_| puts 'got a name!' }
# or
names.each_with_index do |_, idx|
	puts "#{idx + 1}. got a name!"
end
```
##### Misc Tips
* Programs should only have one exit point
* Think about how to invoke the method when naming them
* Know when to use `do/while` vs `while`
* Clarity over terseness
##### Gain Experience Through Struggling
* At this stage beginners tend to feel:
>I want to know the "right way" of "best practice"
>Too much time is wasted on debudding

* It's less impactful to learn "best practices" without first learning *why* they are the best.
* You must learn to be ok with struggling through the "bad" practices first.
* Spend enough time programming that you understand the context for those practices.
* You'll be able to lean on your own experience.
* There are rules by also ways of creative expression.
* Professional developers experience and solve issues *daily*.
##### Approach to Learning
* This will take time
* Do not be discouraged if you can't remember after one try

### 2.6 Variable Scope
##### Variable Types in Ruby
* `CONSTANTS` -- store data that never changes
* `$global` -- available throughout application, ignoring scope boundaries
* `@@class` -- related to class; each instance does not need its own value
* `@instance` -- available throughout current instance of parent class
* `local` -- most common; obeys scope
##### Scope
Scope is determined by where the variable is initialised. In Ruby, this is defined by a *block* (e.g. invoke using `{}` or `do/end`).

> Inner scope can access variables initialised in an outer scope.
> Outer scope cannot access variables initialised in an inner scope.
> Methods create their own scope outside of the execution flow.

* `do/end` is not always a block, such as in `for/in...do/end`.
* Nested blocks create nested scopes and follow the same rules at different levels.
* Variables initialised in an outer scope can be changed in an inner scope.
* Peer blocks cannot access variables initialised in other blocks.
##### Variable Shadowing
**Variable shadowing** -- more than one local variable is available in an inner scope with the same name. This can occur with block parameters. For example:

```ruby
name = 'Smith'
%w(Bob Betty Sue).each do |name|
	puts "#{name} #{name}"
end
# => 'Bob Bob' not 'Bob Smith'
```

**Avoid variable shadowing**. It prevents access to the outer scope and, therefore, changes to the outer scope. Rubocop will catch variable shadowing for you.

##### Variables and Methods
Local variables must be passed to methods as arguments for the method to have access to them. **Methods are not an inner scope**. They have their own, self-contained scope which follow the same rules as regular scope.

* **method definition** -- when we define a Ruby method using the `def` keyword
* **method invocation** -- when we call a method, pre-existing in the Ruby language or custom defined within a program/application

Sometimes methods are called within a block. This is *part* of the method invocation. The block acts as an argument to the method. Blocks and methods interact; the level to which they do is set by the definition and used at the invocation.

```ruby
def greetings
  puts "Goodbye"
end

word = "Hello"

greetings do
  puts word
end

# Outputs 'Goodbye'
```

In the above example, a block is passed as an argument to the method, but the method is not defined to utilise the block in a meaningful way. So the block is ignored.

```ruby
def greetings
  yield
  puts "Goodbye"
end

word = "Hello"

greetings do
  puts word
end

# Outputs 'Hello'
# Outputs 'Goodbye'
```
In the above example, the `yield` keyword is added to the definition, and now the method executes the block once. 

If defined, the method can use the **returned value** of the block to perform some action.

```ruby
a = "hello"

[1, 2, 3].map { |num| a } # => ["hello", "hello", "hello"]
```
`Array#map` doesn't have access to `a`; however, the block *does*. The method uses the returned value of the block.

Blocks *can* access local variables initialised outside of the block and *can* reassign those variables. Therefore, methods can access local variables through interaction with blocks.

**Key Points:**

* The `def...end` construction in Ruby is **method definition**.
* Referencing a method name is **method invocation**.
* Method invocation followed by a `{}` or `do...end` defines a block which is *a part of* the method invocation.
* Method definition *sets* a scope for local variables in terms of parameters and interaction with blocks.
* Method invocation *uses* the scope set up by the method definition.

##### Constants
In procedural style programming, `CONSTANTS` behave like `$globals`. `CONSTANTS`:

* do not need to be passed to methods
* can be initialised in an inner scope and accessed in an outer scope
* have **lexical scope** which sill become more meaningful in OOP.

### 2.7 Pass by Reference vs. Pass by Value
Rubyists disagree on part of Ruby's behaviour: what happens to objects when passed into methods?

* **pass by value** -- operations performed on the object within the method have no effect on the original because it has only been passed a *copy*
* **pass by reference** -- operations performed on the object within the method can effect the original because it has been passed a *reference* to the original 

```ruby
def cap(str)
  str.capitalize
end

name = "jim"
cap(name)
puts name           # => jim
```
The above example appears to be pass by value because the `#cap` method has only capitalised a copy of `name`. 

```ruby
def cap(str)
  str.capitalize!
end

name = "jim"
cap(name)
puts name           # => Jim
```
Adding one small change, however, changes `#cap` to appear to be pass by reference as the original variable is now mutated.

##### What Ruby Does
> pass by reference of the value

or
> call by sharing

When an operation inside a method mutate the caller, it will affect the original object. It is not always easy to tell when an operation will mutate the caller. 

```ruby
# non-destructive
def add_name(arr, name)
  arr = arr + [name]
end

# destructive
def add_name(arr, name)
  arr = arr << name
end
```

You will continuously run into this issue throughout your career.

> Variables are pointers to physical space in memory.

**Reassignment - pointing to a different place**
![Non-destructive](https://d2aw5xe2jldque.cloudfront.net/books/ruby/images/variables_pointers1.jpg)

**Mutating the Caller - pointing to the same place**
![Destructive](https://d2aw5xe2jldque.cloudfront.net/books/ruby/images/variables_pointers2.jpg)

In Ruby, numbers, booleans, ranges, and `nil` are immutable. In fact, any class that does not provide methods which alter its state are immutable. 

Most objects are, however, mutable in Ruby. This is because variables contain merely references to object and not the objects themselves.

> Ruby passes around copies of the references, employing a 3rd strategy which combines the other 2.

* **pass by reference of the value** -- the most accurate way to describe how Ruby treats objects
* **pass by reference** -- accurate but must account for assignment and immutability
* Ruby *appears* to be pbv for immutable objects and pbr for mutable objects


----------

Lesson 4: Ruby Collections
--------------------------------------
### 4.2 Collections Basics
For most programming languages, we store data by putting them into structured containers, or *collections*. Collections can be thought of as "lists of data'. The three most common collection types in Ruby are:

1. String
2. Array
3. Hash

#### String Element Reference
![String Element Reference](http://d1b1wr57ag5rdp.cloudfront.net/images/collections/string-index-diagram.png)

Strings use an integer-based index that represents each character within itself. The index starts at 0. 

You can reference one or more characters using their index.
```ruby
str = 'abcdefghi'
str[2] # => 'c'
str[2, 3] # => 'cde' start at index 2 and return 3 chars
str[2, 3][0] # => 'c' method chaining
```
The third line in the above example is a call to the `#slice` method. It's part of Ruby's *syntactical sugar*. 

#### Array Element Reference
![Array Element Reference](http://d1b1wr57ag5rdp.cloudfront.net/images/collections/array-index-diagram.png)

Arrays are ordered, zero-indexed collections. It can be thought of as a list of elements that are ordered by index, with any object making up an element within it. 

Specific elements can be referenced using their indexes.
```ruby
arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g']
arr[2] # => 'c'
arr[2, 3] # => ['c', 'd', 'e']
arr[2, 3][0] # => 'c'
```
Again, we can use the `#slice` method for this class, but it only returns arrays instead of strings. 

#### Hash Element Reference
![Hash Element Reference](http://d1b1wr57ag5rdp.cloudfront.net/images/collections/hash-key-value-diagram.png)

Instead of using an integer-based index, these collections use key-value pairs. The key or value can be any type of Ruby object; this makes hashes a more expansive and descriptive collection type.
```ruby
hsh = {'fruit'=>'apple', 'vegetable'=>'carrot'}
hsh['fruit'] # => 'apple'
hsh['fruit'][0] # => 'a' string method called on the returned value
```
Keys *must* be unique; the original key-value pair will be overwritten and replaced when a duplicate key is found.

Values *can* be duplicated.

You can access and isolate only the keys or the values using the `Hash#keys` or `Hash#values` methods which both return arrays with the keys/values as the elements.

```ruby
country_capitals = { uk: 'London', france: 'Paris', germany: 'Berlin' }
country_capitals.keys # => [:uk, :france, :germany]
country_capitals.values # => ['London', 'Paris', 'Berlin']
country_capitals.values[0] # => 'London' `Array#[]`
```
In Ruby, it is common practice to use symbols as keys. Symbols in Ruby can be thought of as immutable.

#### Out of Bounds Indices
Using an out of bounds index returns `nil`.
```ruby
'abcde'[5] # => nil
%w(a b c d e) # => nil
```
For strings, this will always mean the index is invalid. However, this is an issue with arrays because `nil` is an object and any object can be an array element. `Array#fetch` attempts to return an element at a position index but throws an `IndexError`.
```ruby
arr = [3, 'd', nil]
arr.fetch(2) # => nil
arr.fetch(3) # => IndexError
```
`#[]` occurs most often in Ruby code. `#fetch` is technically better, but rarely used.

#### Negative Indices
Elements in `String` and `Array` objects can be referenced using negative indices, starting from the last index in the collection, `[-1]`, and working backwards.
```ruby
string = 'abc'
string[0] # => 'a'
string[1] # => 'b'
string[2] # => 'c'
# is also:
string[-1] # => 'c'
string[-2] # => 'b'
string[-3] # => 'a'
string[-4] # => out of bounds
```

#### Invalid Hash Keys
These keys will return `nil`, which like arrays can be a valid hash value. There is also a `Hash#fetch` method which will throw a `KeyError` for invalid keys.

#### Conversion
It is a common practice in Ruby to convert from strings to arrays and vice versa. 
```ruby
str = 'Practice'
arr = str.chars # => ['P', 'r', 'a', 'c', 't', 'i', 'c', 'e']
arr.join # => 'Practice'
```
The methods used above are `String#chars` and `Array#join`.

`Hash` has a `#to_a` method which returns an array of nested arrays for each key-value pair.
```ruby
hash = { sky: 'blue', grass: 'green' }
hsh.to_a => [[:sky, 'blue'], [:grass, 'green']]
```
`Array` has a `#to_h` method which returns a hash with the 0 index and the 1 index of each nested array set as the key-value pairs. Nested arrays with more than 2 indices will throw errors.
```ruby
arr = [[:name, 'Joe'], [:age, 10], [:fav_color, 'blue']]
arr.to_h # => {:name=>'Joe', :age=>10, :fav_color=>'blue'}
```

#### String Element Assignment
Can change the value of a specific character by referring to its index.
```ruby
str = 'joe'
str[0] = 'J'
str # => 'Joe'
```

#### Array Element Assignment
Very similar to strings; can assign elements of an array in the same way.
```ruby
arr = [1, 2, 3, 4, 5]
arr[0] += 1
arr # => [2, 2, 3, 4, 5]
```

#### Hash Element Assignment
Relatively similar; instead of using indices, you can use the keys.
```ruby
hsh = { apple: 'Produce' }
hsh[:apple] = 'Fruit'
hsh # => { :apple=>'Fruit' }
```

### 4.3 Looping
Loops can be used to perform an action on many, if not all, elements in a collection. Loops do the hard work for us, avoiding *lots* of repetitive code.

Looping is comprised of:

1. a loop
2. a counter
3. a way to retrieve the current value
4. a way to exit the loop

Nearly any operation you need can be performed with these tools.

#### Controlling a Loop
When called, `Kernel#loop` creates a simple loop; a block is then passed to it. This method is available everywhere as it is in the `Kernel` module.

The loop requires an exit point, otherwise it will iterate forever. This can be resolved by using the reserved word `break`;  this is usually paired with some kind of conditional statement which will exit the loop when it is appropriate.

#### Iteration
We can tell `#loop` to iterate a specific number of times by using a variable (like "counter") to track the number of iterations performed. The variable should be initialised outside of the loop. 

#### Break Placement
When `break` is placed on the last line of a `loop`, the loop mimics the behaviour of a `do/while` loop. The code within the block is guaranteed to execute at least once. 

When `break` is on the first line, the loop mimics a `while` loop. The `while` keyword always precedes a condition. The code within the block following the `break` may or may not execute at all. 

#### Next
When the `next` keyword is executed, it skips over the remaining code in the block end begins the next iteration. It can be placed in such a way as to accidentally create an infinite loop.

#### Iterating Over Strings
Can use a counter to double as the string character index number. Remember that spaces are characters within strings. If you want to ignore spaces while iterating, you may need to account for this. 

#### Iterating Over Arrays
You can also use a counter to double as the array index number exactly the same way as string; however this iterates over array *elements.* 

#### Iterating Over Hashes
You cannot use a counter to iterate over hash pairs; you will need to grab the keys first. This can be done by using the `Hash#keys` method which will return an array of the keys. A counter can be used to iterate over the keys in the new array. Each key will then be used to grab the associated value. 

### 4.5 Selection & Transformation
Besides **iteration**, the two most common actions to perform on a collection are **selection** and **transformation**. 

> **selection** - picking out certain elements based on some criteria; if there are *n* elements, results in *n* elements or less.
> **transformation** - manipulating every element in a collection; if there are *n* elements, results in exactly *n* elements.

Both utilise looping basics:

1. a loop
2. a counter
3. a way to retrieve the current value
4. a way to exit the loop

They both also require *some criteria*.

#### Looping to Select and Transform

Example of Selection:
```ruby
alphabet = 'abcdefghijklmnopqrstuvwxyz'
selected_chars = ''
counter = 0

loop do
  current_char = alphabet[counter]

  if current_char == 'g' # selection criteria
    selected_chars << current_char
  end

  counter += 1
  break if counter == alphabet.size
end

selected_chars # => "g"
```

Example of Transformation:
```ruby
fruits = ['apple', 'banana', 'pear']
transformed_elements = []
counter = 0

loop do
  current_element = fruits[counter]

  transformed_elements << current_element + 's' # transformation criteria

  counter += 1
  break if counter == fruits.size
end

transformed_elements # => ["apples", "bananas", "pears"]
```

When performing transformation, it's always important to pay attention to whether the original collection was mutated of if a new collection was returned. In the example above, a new collection was returned.

#### Extracting to Methods
Often convenience methods are used to perform specific actions for selection and transformation.
```ruby
if 'aeiouAEIOU'.include?(current_char)
  selected_chars << current_char
end
```
The above `if` statement, for example, could be used to create a `select_vowels` method. Using `String#include?` makes this action much easier. 

Previous to what was originally said, the example below shows a transformation action on a selected subset of elements in a collection:
```ruby
def double_odd_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if current_number.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end
```

#### More Flexible Methods
Methods can be defined in such a way that additional arguments can be passed to alter the logic of the iteration. This creates more flexible and generic methods.

For example, a method could be written so that the user can choose either all the fruit *or* vegetable key-value pairs in the example produce hash.

#### The `for` Loop
The `Kernel#loop` method is one of many ways to loop in Ruby. A `for` loop can produce the same result as `loop`.
```ruby
alphabet = 'abcdefghijklmnopqrstuvwxyz'
for char in alphabet.chars
  puts char
end
```
In this example, `char` represents the value of the current array element. Don't worry about differences in syntax; the underlying concepts still remain.

#### Summary
Typically: 

1. iteration
2. selection, and
3. transformation

...are generic actions that we can move into a method so that we can repeatedly perform these operations on different collections. 

Understand how these methods can be made more generic by allowing for additional parameters.

It's common to chain actions on collections. Be careful not to chain actions on empty collections or `nil`. This can break programs.

### 4.6 Methods
Ruby provides built-in methods which can be used more easily than loop to iterate over collections.

#### `#each`
Iterating over collections is so common that Ruby has provided a simple methods to accomplish this.
```ruby
[1, 2, 3].each do |num|
  puts num
end
```
The `#each` method takes a block which is executed for each iteration. The above example will print each (get it?) element in the array using the `#puts` method.

For each iteration, `#each` sends the value of the current element to the block in the form of an argument, `num`.

In `Array#each`, the method knows there's only one element per iteration, so it only sends one argument to the block. Hashes need 2 arguments to represent the key-value pair:
```ruby
hash = { a: 1, b: 2, c: 3 }
hash.each do |key, value|
  puts "The key is #{key} and the value is #{value}."
end
```
One of the main differences between `#each` and `#loop` is that the former will return the original collection rather than `nil`.

#### `#select`
Arrays and Hashes use this built-in method to iterate over a collection and perform selection.
```ruby
[1, 2, 3].select do |num|
  num.odd?
end # => [1, 3]
```
To perform selection, `#select` evaluates the return value of the block. This return value (much like methods) is the return value of the last expression within the block. When evaluating the block's return value, `#select` only cares about its truthiness. If the return value of the block is "truthy," then the element during that iteration will be selected.

For example, the block value below will always be "truthy" as any integer +1 is never false. Therefore, the method will select all the elements in the array.
```ruby
[1, 2, 3].select do |num|
  num + 1
end # => [1, 2, 3]
```
The returned array is a **new collection** which happens in the case to be `==` to the original.
```ruby
[1, 2, 3].select do |num|
  num + 1
  puts num
end # => [] ; all elements will be displayed but not returned
```
Since `puts num`  is the last evaluated expression and `puts ...` always returns `nil`, the method returns an empty collection. No iteration evaluates to `true`.

#### `#map`
Also considers the return value of a block like `#select`. However, `#map` will perform transformation on the block's return value.
```ruby
[1, 2, 3].map do |num|
  num * 2
end # => [2, 4, 6] ; a new collection
```
This action will be repeated for each element in the collection. `#map` *always* performs transformation based on the block's return value. If selection criteria is expressed in the block, the return value will be a boolean.
```ruby
[1, 2, 3].map do |num|
  num.odd?
end # => [true, false, true]
```
Much like `#select`, the return value in the block below will always be `nil`. However, `#map` *always* transforms, so the example below will still return an array of 3 elements.
```ruby
[1, 2, 3].map do |num|
  num.odd?
  puts num
end # => [nil, nil, nil]
```
`#map` does not care about truthiness!

How does `#map` treat statements? 
```ruby
[1, 2, 3].map do |num|
  "hi"
end # => ['hi', 'hi', 'hi']
```
The return value of the above block will always be `'hi'`, so `#map` will always add this value to the new collection.

#### Enumerable
It's important to note that not all objects in Ruby can access the `#each`, `#select`, and `#map` methods. `Array` and `Hash` both have their own version of the `#each` method. `#select` and `#map` are defined in the Enumerable module which then provides `Array` and `Hash` access to these methods 

**Certain collection types have access to specific methods for a reason.** String does not use the Enumerable module, for example.

#### Summary
| Method    | Action         | Looks @ Ret Val? | New Coll? | Ret Coll Length |
| --------- | -------------- | ---------------- | --------- | --------------- |
| `#each`   | Iteration      | No               | No (org)  | org == returned |
| `#select` | Selection      | Yes (truthiness) | Yes       | org >= returned |
| `#map`    | Transformation | Yes              | Yes       | org == returned |

### 4.7 More Methods

#### `Enumerable#any?`
[Ruby Docs:](https://ruby-doc.org/core-2.3.1/Enumerable.html#method-i-any-3F)
> **any? [{ |obj| block }] → true or false**
> 
> Passes each element of the collection to the given block. The method returns `true` if the block ever returns a value other than `false` or `nil`.

```ruby
[1, 2, 3].any? do |num|
  num > 2
end # => true
```
`#any?` looks at the **truthiness** of the **block's** return value in order to determine what the **method's** return value will be. If the block ever returns a truthy value, the method will return `true`. This method can also be used with hashes:
```ruby
{ a: 'ant', b: 'bear', c: 'cat' }.any? do |k, v|
  v.size > 4
end # => false (all values have 4 or less chars)
```

#### `Enumerable#all?`
[Ruby Docs:](https://ruby-doc.org/core-2.3.1/Enumerable.html#method-i-all-3F)
> **all? [{ |obj| block } ] → true or false**
> 
> Passes each element to the block. The methods returns `true` if the block never returns `false` or `nil`.

`#all?` is similar to `#any?`. This time, though, the method only returns `true` if the block returns a truthy value in **every** iteration.
```ruby
[1, 2, 3].all? do |num|
  num > 2
end # => false
```
It can also be used on hashes:
```ruby
{ a: 'ant', b: 'bear', c: 'cat' }.all? do |num|
  v.length >= 3
end # => true
```

#### `Enumerable#each_with_index`
[Ruby Docs:](https://ruby-doc.org/core-2.3.1/Enumerable.html#method-i-each_with_index)
> **each_with_index(*args) { |obj, i| block } → enum**
> 
> Calls *block* with two arguments, the item and its index, for each item in *enum*. Given arguments are passed through to `each()`

This method is nearly identical to `#each`. The block's return value is ignored. This method takes two arguments with the second argument representing the index of each element. 
```ruby
[1, 2, 3].each_with_index do |num, index|
  puts "The index of #{num} is #{index}."
end # => [1, 2, 3]
# Output:
# The index of 1 is 0.
# The index of 2 is 1.
# The index of 3 is 2.
```
On hashes, the 1st argument is an array containing the key-value pair:
```ruby
hash = { a: 'ant', b: 'bear', c: 'cat' }
hash.each_with_index do |pair, index|
  puts "The index of #{pair] is #{index}."
end # => { :a=>'ant', :b=>'bear', :c=>'cat'}
# Output
# The index of [:a, 'ant'] is 0.
# The index of [:b, 'bear'] is 1.
# The index of [:c, 'cat'] is 2.
```

#### `Enumerable#each_with_object`
[Ruby Docs:](https://ruby-doc.org/core-2.3.1/Enumerable.html#method-i-each_with_object)
> **each_with_object(obj) { |(*args), memo_obj| ... } → obj**
> 
> Iterates the given block for each element with an arbitrary object given and returns the initially given object.

This method takes a method argument which is a collection object that will be returned by the method. The block takes 2 arguments: the current element and the collection object.
```ruby
[1, 2, 3].each_with_object([]) do |num, array|
  array << num if num.odd?
end # => [1, 3]
```
Can also be used to create an array from a hash:
```ruby
hash = { a: 'ant', b: 'bear', c: 'cat' }
hash.each_with_object([]) do |pair, array|
  array << pair.last
end # => ['ant', 'bear', 'cat']
# effectively the same as the values method
```
Can also use `( )` to capture the keys and values separately:
```ruby
hash = { a: 'ant', b: 'bear', c: 'cat' }
hash.each_with_object({}) do |(k, v), hash|
  hash[v] = k
end # => {'ant'=>:a, 'bear'=>:b, 'cat'=>:c}
```

#### `Enumerable#first`
[Ruby Docs:](https://ruby-doc.org/core-2.3.1/Enumerable.html#method-i-first)
> **first → obj or nil**
> **first(n) → an_array**
> 
> Returns the first element, or the first *n* elements, of the enumerable.

This method does not take a block, but can be passed an optional argument which represents the number of objects to return.

Without an argument: `[1, 2, 3].first # => 1`
With an argument:
```ruby
hash = { a: 'ant', b: 'bear', c: 'cat' }.first(2)
# => [[:a, 'ant'], [:b, 'bear']]
```
##### **Notes:**
1. Hashes are normally thought of as unordered. In some languages, the order is not at all preserved. This used to be true for Ruby; since Ruby 1.9, order is preserved through insertion order. Calling this method in Ruby doesn't make sense, but Ruby still let's us do it.
2. Notice that the returned value is a nested array. This is unexpected by can be returned to a hash by using `Array#to_h`.
3. `#first` is normally used on arrays.

#### `Enumerable#include?`
[Ruby Docs:](https://ruby-doc.org/core-2.3.1/Enumerable.html#method-i-include-3F)
> **include?(obj) → true or false**
> 
> Returns `true` if any member of *enum* equals *obj*. Equality is tested using `==`. 

This method does not take a block, but requires one argument. It returns `true` if the argument exists in the collection.

`[1, 2, 3].include?(1) # => true`

When called on a hash, the method only checks keys, not values:
```ruby
hash = { a: 'ant', b: 'bear', c: 'cat' }
hash.include?('ant') # => false
hash.include?(:a) # => true
```
`Hash#include?` is an alias for `Hash#key?` or `Hash#has_key?` which are preferred for having an explicit intention. You can also use `Hash#value?` or `Hash#has_value?` to determine if a value exits in a hash.

#### `Enumerable#partition`
[Ruby Docs:](https://ruby-doc.org/core-2.3.1/Enumerable.html#method-i-partition)
> **partition { |obj| block } → [ true_array, false_array ]**
> 
> Returns two arrays, the first containing the elements of *enum* for which the block evaluates to true, the second containing the rest.

The method divides the elements of the current collection into two collections.
```ruby
[1, 2, 3].partition do |num|
  num.odd?
end # => [[1, 3],[2]]
```
The most idiomatic way to use `#partition` is to parallel assign variables to capture the divided arays.
```ruby
odd, even = [1, 2, 3].partition do |num|
			  num.odd?
			end
odd # => [1, 3]
even # => [2]
```
Even if the collection is a hash, the return value of `#partition` will always be an array.

#### Summary
Method documentation will normally include:

 - One or more method signatures (whether the method takes arguments and/or a block and what it returns).
 - A brief description of how the method is used, often covering different use cases.
 - Some code examples, again usually covering various use cases.

Reading a method's documentation allows us to understand how the method works and to more forward knowing:

 - Whether the method takes a block
 - How it handles the block's return value
 - What the method itself returns.

### 4.10 Summary
Some of the most commonly used iterative methods are `each`, `select`, and `map`.

Methods called on Ruby collection objects are often used with a block. The return value of the block is passed back to the method on each iteration. Be aware of:

 - What the method does with the return value
 - What the ultimate return value of the method is
 - Any side-effects of the block's code

Ruby provides more methods which are useful when working with collections.

 - Be aware that these methods exist and know where to look for them.
 - Know how to read the documentation in order to understand the method's return value, how it uses the block's return value (if it takes a block), and whether the method is destructive.

----------

Lesson 5: Advanced Ruby Collections
-----------------------------------------------------
### 5.2 Sorting
Another way to work with collections is to sort them into some kind of order. This is mostly performed on arrays because array indices render item order important. Strings don't have access to sorting methods. `Hash` objects can now be sorted (since Ruby 1.9), but there generally isn't a need to do this.

#### What is sorting?
> **sorting** - setting the order of items in a collection according to certain criteria.

We need some kind of mechanism to arrange all the items in a collection into a particular order. These actions can be performed algorithmically via the use of fairly simple looping mechanisms. However, this code would have to be fairly complex. Ruby provides `#sort` and `#sort_by`; we don't need to understand their full implementation, but we do need to understand the way they apply criteria in order to sort.

#### Comparison
Sorting *compares* items in a collection with each other and orders them based on the result. When we call `Array#sort`, it can sort alphabetically *or* numerically even though it doesn't know what kind of objects the array holds. `#sort` uses another method to determine how to order the elements; `<=>`, sometimes called the spaceship operator. 

#### The `<=>` Method

Any object in a collection that we want to sort *must* implement a `<=>` method. This method performs *comparison* between two objects of the same type and returns `-1`, `0`, or `1` depending on whether the 1st object is less than, equal to, or greater than the 2nd. If two objects cannot be compared, `nil` is returned.

```ruby
2 <=> 1 # => 1
1 <=> 2 # => -1
2 <=> 2 # => 0
'b' <=> 'a' # => 1
'a' <=> 'b' # => -1
'b' <=> 'b' # => 0
1 <=> 'a' # => nil
```

If `<=>` returns `nil` to a sort, an argument error is thrown.

```ruby
['a', 1].sort # => ArgumentError
```
`#sort` is only concerned with the return value of `<=>`.

You need to know:

 1. Does an object type implement a `<=>` method?
 2. If yes, what is the implementation for that object? (It will be different for each object type.

#### `String#<=>`
[Ruby Docs:](https://ruby-doc.org/core-2.3.1/String.html#method-i-3C-3D-3E)
> **string <=> other_string → -1, 0, +1 or nil**
> 
> If the strings are of different lengths, and the strings are equal when compared up to the shortest length, then the longer string is considered greater than the shorter one.
> 
> <=> is the basis for the methods <, <=, >, >=, and between?, included from module Comparable. The method String#== does not use Comparable#==.

#### The ASCII Table
String order is determined by a character's position in the [ASCII Table](https://en.wikipedia.org/wiki/ASCII#Code_chart). Some examples of ASCIIbetical order:
```ruby
'A' <=> 'a' # => -1
'!' <=> 'A' # => -1
'b'.ord # => 98 (ASCII position)
'}'.ord # => 125 ('b' comes before '}')
```
Some useful rules to remember rough ASCIIbetical order:

 - Uppercase letters come before lowercase.
 - Digits and (most) punctuation come before letters.
 - The *extended* ASCII table (containing accents, etc.) comes after the main table.

#### The `#sort` Method
Calling this method on an array returns a new array of sorted items. We can also call `#sort` with a block to control how the items are sorted. The return value of the block must be `-1`, `0`, `1`, or `nil`.
```ruby
[2, 5, 3, 4, 1].sort do |a, b|
  a <=> b
end # => [1, 2, 3, 4, 5] (same as without the block)

[2, 5, 3, 4, 1].sort do |a, b|
  b <=> a
end # => [5, 4, 3, 2, 1]

[2, 5, 3, 4, 1].sort do |a, b|
  puts "a is #{a} and b is #{b}."
  a <=> b # must return -1, 0, 1, or nil
end
# a is 2 and b is 5
# a is 4 and b is 1
# a is 3 and b is 1
# a is 3 and b is 4
# a is 2 and b is 1
# a is 2 and b is 3
# a is 5 and b is 3
# a is 5 and b is 4
# => [1, 2, 3, 4, 5]
```
The output strings above should give some idea as to how complex the `#sort` method is. 

In strings like `'cap'` and `'cape'`, the 1st three characters are the same but `'cape'` is longer. `'cape'` is considered "greater than" `'cap'`.

Arrays are compared "element-wise" instead of "character-wise". An error can be thrown if two elements are different objects, but not all situations will throw the error as the methods might return an order before the objects are compared. 

#### The `#sort_by` Method
This method is similar to `#sort`. It's usually called with a block which determines how the items are compared.
```ruby
['cot', 'bed', 'mat'].sort_by do |word|
  word[1]
end # => ["mat", "bed", "cot"]
```
Here we are sorting using the character at index `1` of each string, so only the characters 'a', 'e', and 'o' are compared and the other characters are ignored entirely. 

You can only use this method to sort hashes. Two arguments must be passed to the block, the key and the value. The last argument in the block determines what we sort by.
```ruby
people = {kate: 27, john: 25, mike: 18}
people.sort_by do |name, age|
  age
end # => [[:mike, 18], [:john, 25], [:kate, 27]]
```
`#sort_by` always returns an array. By sorting on the names, we would be sorting symbols, which is effectively comparing the string version of the symbols. (Look at the `<=>` method for the object you want to sort to determine how it is carried out.)

#### Other Comparison Methods
> All in `Enumerable`:
> **min** - returns the minimum valued object of enum
> **max** - returns the objects with the maximum value
> **minmax** - returns a 2-element array with the minimum and maximum values
> **min_by** - returns the object with the minimum value based on a block
> **max_by** - returns the object with the maximum value based on a block
> **minmax_by** - returns a 2-element array with the minimum and maximum values based on a block

#### Summary

 - Sorting is complex to carry out algorithmically.
 - Comparison is at the heart of sorting.
 - Methods other than `#sort` and `#sort_by` also use `<=>`.

### 5.3 Nested Data Structures
#### Referencing Collection Elements
`arr = [[1, 3], [2]]` - Each of the nested arrays have their own index, and each inner elements have a specific index. 

![Sub-array indices](http://d1b1wr57ag5rdp.cloudfront.net/images/collections/nested-array-diagram.png)

The inner elements can be called using chained methods:
```ruby
arr[0] # => [1, 3]
arr[0][1] # => 3
```

#### Updating Collection Elements
Using a destructive action to assign new values to the array elements can be done at inner and outer levels in a similar fashion:
```ruby
arr = [[1, 3], [2]]
arr[1] = 'hi there'
arr # => [[1, 3], 'hi there']

arr = [[1, 3], [2]]
arr[0][1] = 5
arr # => [[1, 5], [2]]
```
In the example above, it looks like we've chained reference methods, but we have not.

 - `arr[0]` - element reference; returns [1, 3]
 - `[1] = 5` - element update; same as [1, 3][1] = 5

Inserting elements into a nested array is similar to the examples above. First, the element array must be referenced, then the element appended.
```ruby
arr = [[1], [2]]
arr[0] << 3
arr # => [[1, 3], [2]]
```
The appended inner element can, of course, be any object, including another array.

#### Other Nested Structures
Hashes can also be bested within an array. 

![Nested hashes in an array](http://d1b1wr57ag5rdp.cloudfront.net/images/collections/array-of-hashes.png)

Adding new key-value pairs are very similar to appending new elements to inner array. First, the inner collection must be referenced then the new pair added.
```ruby
arr = [{a: 'ant'}, {b: 'bear'}]
arr[0][:c] = 'cat'
arr # => [{:a=>'ant', :c=>'cat'}, {:b=>'bear'}]
```
Arrays can hold any type of Ruby object. Here are some examples of how to retrieve more complex structures:
```ruby
arr = [['a', ['b']], { b: 'bear', c: 'cat' }, 'cab']

arr[0]              # => ["a", ["b"]]
arr[0][1][0]        # => "b"
arr[1]              # => { :b => "bear", :c => "cat" }
arr[1][:b]          # => "bear"
arr[1][:b][0]       # => "b"
arr[2][2]           # => "b"
```

#### Variable Reference for Nested Collections
A confusing part of working with nested collections is when variables reference inner collections directly. 
```ruby
a = [1, 3]
b = [2]
arr = [a, b]
arr # => [[1, 3], [2]]
```
When the local variables `a` and `b` are placed as elements in an array, it looks like the actual `Array` objects have themselves have been added to the outer array. (True to a certain extent.) What happens if `a` is modified?
```ruby
a[1] = 5
arr # => [[1, 5], [2]]
```
`a` and `arr[0]` are still pointing to the same object:

![Variable Reference - referencing the same object](http://d1b1wr57ag5rdp.cloudfront.net/images/collections/variables-as-pointers-1.png)

What happens if the 1st array in `arr` is modified?
```ruby
arr[0][1] = 8
arr # => [[1, 8], [2]]
a # => [1, 8]
```
`a` and `arr[0]` are still pointing to the same object:

![Variable Reference - still referencing the same object](http://d1b1wr57ag5rdp.cloudfront.net/images/collections/variables-as-pointers-2.png)

#### Shallow Copy
Ruby provides two methods that can copy objects, including collections: `#dup` and `#clone`. These methods create a *shallow copy*. Only the object that the method is called on is copied. If the object contains other objects, those objects will be *shared*. This has a major impact. This might not automatically fit in with what you would assume these methods *should* do.

`#dup` allows objects within the copied object to be modified. `#clone` works the same way. Here are same examples of element modification:
```ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2[1].upcase!
arr2 # => ["a", "B", "c"]
arr1 # => ["a", "B", "c"]

arr1 = ["abc", "def"]
arr2 = arr1.clone
arr2[0].reverse!
arr2 # => ["cba", "def"]
arr1 # => ["cba", "def"]
```
`String#upcase!` and `String#reverse!` were called on the object *within* the array rather than the array itself. When using these methods, it's important to remember and understand what you want to modify, the collection or its elements. Here's an example of collection modification:
```ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char| # Array method
  char.upcase
end
arr1 # => ["a", "b", "c"]
arr2 # => ["A", "B", "C"]
```
`Array#map` modifies the array by *replacing* each element of `arr2` with a new value. This leaves the original array untouched.

#### Freezing Objects
The main difference between `#dup` and `#clone` is that `#clone` preserves the frozen state of the object. In Ruby, only mutable objects can be frozen to prevent modification. Immutable objects (like integers and booleans) are already frozen.

`#dup`'d frozen arrays, for example, can have new elements added. This is not true for `#clone`. Array *elements* can still be modified, however.
```ruby
arr1 = [1, 2, 3].freeze # has to be frozen first
arr2 = arr1.dup
arr3 = arr1.clone
arr2 << 4 # works
arr3 << 4 # RuntimeError

arr = [[1], [2], [3]].freeze
arr[2] << 4 # modifying element
arr # => [[1], [2], [3, 4]]
```
You can use the `#frozen?` method to check if an object is frozen. 

#### Deep Copy
In Ruby, there's no built in way to create a deep copy or to deep freeze objects within objects. This functionality *can be* implemented. When working with collections, including nested collections, it is therefore important to know what level you are working at.

### 5.4 Working With Blocks
When evaluating code, ask the following questions:

 - What is the type of action being performed (method call, block, conditional, etc.)?
 - What is the objects that action is being performed on?
 - What is the side-effect of that action (e.g. output or destructive action)?
 - What is the return value of that action?
 - Is the return value used by whatever instigated the action?

#### Example 1:
```ruby
1| [[1, 2], [3, 4]].each do |arr|
2|   puts arr.first
3| end # 1 # 3 # => [[1, 2], [3, 4]]
```
| Ln | Action | Object | Side Effect | Return Val | Is it used? |
| -- | ------ | ------ | ----------- | ---------- | ----------- |
| 1 | method call (`#each`) | outer array | none | the calling object | no |
| 1 - 3 | block execution | each sub-array | none | `nil` | no |
| 2 | method call (`#first`) | each sub-array | none | element @ 0 index of sub-array | yes, used by `#puts` |
| 2 | method call (`#puts`) | element @ 0 index of sub-array | outputs string representation of `Integer` | `nil` | yes, used to determine return value of the block |

#### Example 2:
```ruby
1| [[1, 2], [3, 4]].map do |arr|
2|   puts arr.first
3| end # 1 # 3 # => [nil, nil]
```
| Ln | Action | Object | Side Effect | Return Val | Is it used? |
| -- | ------ | ------ | ----------- | ---------- | ----------- |
| 1 | method call (`#map`) | outer array | none | new array `[nil, nil]` | no |
| 1 - 3 | block execution | each sub-array | none | `nil` | yes, used by `#map` for transformation |
| 2 | method call (`#first`) | each sub-array | none | element @ 0 index of sub-array | yes, used by `#puts` |
| 2 | method call (`#puts`) | element @ 0 index of sub-array | outputs string representation of `Integer` | `nil` | yes, used to determine return value of the block |

#### Example 3 (my turn):
```ruby
1| [[1, 2], [3, 4]].map do |arr|
2|   puts arr.first
3|   arr.first
4| end # 1 # 3 # => [1, 3]
```
| Ln | Action | Object | Side Effect | Return Val | Is it used? |
| -- | ------ | ------ | ----------- | ---------- | ----------- |
| 1 | method call (`#map`) | outer array | none | new array `[1, 3]` | no |
| 1 - 4 | block execution | each sub-array | none | sub-array element @ 0 index | yes, used by `#map` for transformation |
| 2 | method call (`#first`) | each sub-array | none | sub-array element @ 0 index | yes, used by `#puts` |
| 2 | method call (`#puts`) | sub-array element @ 0 index | outputs string representation of `Integer` | `nil` | no |
| 3 | method call (`#first`) | each sub-array | none | sub-array element @ 0 index | yes, used to determine the value of the block |

#### Example 4:
```ruby
1| my_curr = [[18, 7], [3, 12]].each do |arr|
2|   arr.each do |num|
3|     if num > 5
4|       puts num
5|     end
6|   end
7| end # 18 # 7 # 12 # => [[18, 7], [3, 12]]
```

| Ln | Action | Object | Side Effect | Return Val | Is it used? |
| -- | ------ | ------ | ----------- | ---------- | ----------- |
| 1 | variable assignment | n/a | none | `[[18, 7], [3, 12]]` | no |
| 1 | method call (`#each`) | [[18, 7], [3, 12]] | none | the calling object `[[18, 7], [3, 12]]` | yes, used by variable assignment to `my_arr` |
| 1 - 7 | outer block execution | each sub-array | none | each sub-array | no |
| 2 | method call (`#each`) | each sub-array | none | the calling object (current sub-array | yes, used to determine return value of outer block |
| 2 - 6 | inner block execution | each current sub-array element | none | `nil` | no |
| 3 | comparison (`>`) | each current sub-array element | none | Boolean | yes, if evaluated by `if` |
| 3 - 5 | conditional (`if`) | each current sub-array element | none | `nil` | yes, used to determine the return value of inner block |
| 4 | method call (`#puts`) | each current sub-array element | outputs a string representation of an `Integer` | `nil` | yes, to determine the return value of the inner block |

There are 4 return values: the return values of both calls to `#each`,  and the return value of both blocks. `#each` ignores the return value of the *block* which can be different to the return value of `#each`.

#### Example 5: 
```ruby
1| [[1, 2], [3, 4]].map do |arr|
2|   arr.map do |num|
3|     num * 2
4|   end
5| end # => [[2, 4], [6, 8]]
```

| Ln | Action | Object | Side Effect | Return Val | Is it used? |
| -- | ------ | ------ | ----------- | ---------- | ----------- |
| 1 | method call (`#map`) | the original array | none | new transformed array `[[2, 4], [6, 8]]` | no |
| 1 - 5 | outer block execution | each sub-array | none | each transformed sub-array | yes, used by `#map` for transformation |
| 2 | method call (`#map`) | each sub-array | none | new transformed sub-array | yes, determines outer block return value |
| 2 - 4 | inner block execution | each sub-array element | none | an integer | yes, used by `#map` for transformation |
| 3 | method call (`#*`) or `num * 2` | n/a | none | an integer | yes, determines the inner block return value |

#### Example 6:
```ruby
1| [{a: 'ant', b: 'elephant'}, {c: 'cat'}].select do |hash|
2|   hash.all? do |key, value|
3|     value[0] == key.to_s
4|   end
5| end # => [{:c=>'cat'}]
```

 - **Line 1:** Method call (`#select`) on array object; returned value is a new array of selected hashes and is not used.
 - **Lines 1-5:** Outer block execution on each hash element; returned value is each selected hash element which is used by `#select` for selection.
 - **Line 2:** Method call `#all?` on each hash element; returned value is a Boolean which is used to determine the outer block's return value. 
 - **Line 2-4:** Inner block execution on each key-value pair; returned value is a Boolean which is used by `#all?`.
 - **Line 3:**
	 - 1. Method call `#[]` on each value; return the 1st character string of the value's string object
	 - 2. Method call `#to_s` on each key; returns a string representation of the key's symbol object
	 - 3. Comparison `==` on each returned values of items 1 & 2; returns a Boolean which determines the inner block's returned value.

#### Example 10:
```ruby
[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1
      el + 1
    else
      el.map do |n|
        n + 1
      end
    end
  end
end # => [[[2, 3], [4, 5]], [6, 7]]
```

The above example has uneven nested levels of arrays within the original array; we want to add 1 to each value without changing the original structure. We first need to access those values regardless of how many arrays they are nest in. We need to determine if the current element is an array or an integer (within the if/else/end lines).

#### Mutating Collections While Iterating
**Don't do this!**

Since iteration is the basis of selection and transformation, that implies that you should not mutate the collection within those blocks. Pay extreme attention to destructive method calls.

#### Summary
Some things to remember:

 - If at first code appears opaque of complex, take time to break it down step by step.
 - If necessary, use some sort of systematic approach (such as the tabular method outlined in this assignment). 
 - Figure out what is happening at each step, paying particular attention to:
	 - the return value
	 - any side effects
 - Pay attention to the return values of all statements in your code, especially where implicit return values are being relied on.
 - Make sure you have a clear understanding of the underlying concepts such as data structures, loops, iterative methods, and the blocks passed to them (go back over earlier assignments if necessary).
 - Be clear about the method implementation of the iterative method(s) being used, especially:
	 - What values are passed to the block
	 - What the method does with the return value of the block
 - If you are unclear about a method implementation, a good initial step is to refer to the Ruby Docs.

### 5.6 Summary

Some important points to remember:

 - You should know how to reference items within nested collections in order to manipulate them.
 - You should be aware when you make a shallow copy of a collection - the objects within are shared between the copy and the original.
 - When working with blocks, especially when using nested collections:
	 - Take time to break down and understand a collection's structure
	 - Choose an appropriate method; be clear on its implementation and return value
	 - Understand what is being returned by the various methods and blocks at each level
	 - When iterating through nested collections, be particularly aware of the return value of the block and any side effects of the code within the block

Being able to manipulate a collection of data is very often a necessary component of a solution to an overall coding problem. 

----------
