```ruby
# BEGIN and END
BEGIN { puts "This is the BEGIN block." }  # Executes before any code
END { puts "This is the END block." }      # Executes after all code

# Alias, and, begin, break, case, class
alias old_method new_method  # Creates an alias for a method
and_result = true and false # Logical AND
begin
  raise "An error occurred"  # Begin block for exception handling
rescue => e
  puts "Caught an error: #{e.message}"  # Rescue block
end

case 3
when 1
  puts "One"
when 2
  puts "Two"
else
  puts "Something else"
end

class Person  # Class definition
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello, #{@name}!"
  end
end

# Defining a method inside a class
def greet(name)
  "Hello, #{name}!"
end

# Defined?
puts defined?(greet)  # Checks if greet method is defined

# Do, else, elsif, end, ensure, false
do_something = false
if do_something
  puts "Doing something"
else
  puts "Not doing anything"
end

# For, in, module, next, nil, not, or
for i in 1..3
  puts i
  break if i == 2
end

module Greetings
  def self.say_hello
    puts "Hello!"
  end
end

next if nil  # Skip iteration if nil
or_result = true or false  # Logical OR

# Redo, rescue, retry, return, self, super, then, true
redo_example = 0
begin
  redo_example += 1
  raise if redo_example < 3
rescue
  puts "Retrying..."
  retry
end

def example_method
  return "Returning early"
  puts "This will never execute"
end
puts example_method

self_object = self  # Self refers to the current object
super_method = super  # Calls the method from the parent class

# Then, true, undef, unless, until, when, while, yield
true_value = true
undef :true_value  # Undefines the symbol

unless true_value
  puts "This won't execute because true_value is true"
end

until false
  puts "This runs only once."
  break
end

while true
  puts "This is an infinite loop unless we break."
  break
end

# Yield: Yielding control to a block
def call_block
  yield("Hello from the block!") if block_given?
end

call_block { |msg| puts msg }

# Special variables: __FILE__, __LINE__
puts "Current file: #{$__FILE__}, Line: #{$__LINE__}"

# Comparison Operators
puts 5 == 5      # Equal to
puts 5 === 5     # Case equality (used in case statements)
puts 5 != 6      # Not equal to
puts 5 > 4       # Greater than
puts 4 < 5       # Less than
puts 5 >= 4      # Greater than or equal to
puts 4 <= 5      # Less than or equal to
puts 5 <=> 5     # Spaceship operator (comparison)
puts 5.eql?(5)   # Value and type equality
puts 5.equal?(5) # Object identity comparison

# Array Methods
arr = [1, 2, 3, 4]
puts arr.map { |x| x * 2 }      # Multiplying each element by 2
puts arr.select { |x| x.even? } # Selecting even numbers
puts arr.reject { |x| x.even? } # Rejecting even numbers
puts arr.reduce(:+)             # Reducing to sum of elements
arr.each { |x| puts x }         # Iterating over each element
arr.each_with_index { |x, i| puts "#{i}: #{x}" } # Iterating with index
puts arr.flatten                # Flattening nested arrays
puts arr.join("-")              # Joining array elements with a separator
puts arr.sort                   # Sorting array

# String Methods
str = "hello world"
puts str.upcase    # Convert to uppercase
puts str.downcase  # Convert to lowercase
puts str.capitalize # Capitalize first letter
puts str.split     # Split string into array
puts str.gsub("world", "Ruby") # Global substitution
puts "hello" =~ /ell/  # Match with regex
puts str.scan(/\w+/)  # Scan for word-like patterns
puts str.strip       # Strip whitespace

# Hash Methods
my_hash = { name: "John", age: 30 }
puts my_hash.keys      # Returns keys of the hash
puts my_hash.values    # Returns values of the hash
my_hash.each_pair { |key, value| puts "#{key}: #{value}" }  # Iterate over key-value pairs
puts my_hash.merge({ city: "New York" })  # Merging another hash
puts my_hash.fetch(:name)   # Fetch value for a key

# Enumerable Methods
arr = [1, 2, 3, 4]
puts arr.any? { |x| x > 3 }   # Check if any element satisfies the condition
puts arr.all? { |x| x > 0 }   # Check if all elements satisfy the condition
puts arr.none? { |x| x < 0 }  # Check if none elements satisfy the condition
puts arr.count { |x| x.even? }  # Count elements satisfying the condition
puts arr.find { |x| x > 3 }    # Find the first element satisfying the condition
```