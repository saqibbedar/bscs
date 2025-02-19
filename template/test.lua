-- Basic Types
local number = 10       -- local variable assignment
local str = "Hello"     -- string assignment
local bool = true       -- boolean assignment
local nilVar = nil      -- nil assignment

-- Operators
local sum = 5 + 3       -- Addition
local diff = 5 - 3      -- Subtraction
local product = 5 * 3   -- Multiplication
local quotient = 5 / 3  -- Division
local floorDiv = 5 // 3 -- Floor division (Lua 5.3+)
local mod = 5 % 3       -- Modulo
local exp = 5 ^ 2       -- Exponentiation

-- Comparison Operators
local isEqual = (5 == 5)     -- Equal to
local isNotEqual = (5 ~= 3)  -- Not equal to
local isLessThan = (5 < 3)   -- Less than
local isGreaterThan = (5 > 3) -- Greater than
local isLessEqual = (5 <= 3)  -- Less than or equal to
local isGreaterEqual = (5 >= 3) -- Greater than or equal to

-- Logical Operators
local logicalAnd = true and false    -- Logical AND
local logicalOr = true or false     -- Logical OR
local logicalNot = not true         -- Logical NOT

-- String Operations
local concatStr = "Hello" .. " " .. "World" -- String concatenation
local strLength = #concatStr            -- Length operator

-- Control Flow: if, elseif, else, and loops
if number == 10 then
  print("Number is 10")
elseif number == 5 then
  print("Number is 5")
else
  print("Number is not 10 or 5")
end

-- Functions
function greet(name)
  return "Hello, " .. name
end
print(greet("Lua"))

-- Loops
for i = 1, 5 do
  print(i)
end

repeat
  print("This will print until the condition is true")
until false

while number > 5 do
  number = number - 1
  print("Decrementing number: " .. number)
end

-- Goto statement (caution: generally discouraged)
::label::    -- Lua label
print("This is a label")
goto label  -- Go to the label

-- Logical Operations with `and`, `or`, and `not`
local result = (5 > 3) and "True" or "False"
print(result)

-- Using nil for uninitialized variable
local uninitializedVar
if uninitializedVar == nil then
  print("Variable is nil")
end

-- Tables (as objects/arrays in Lua)
local person = {name = "John", age = 30}
print(person.name) -- Accessing table field

-- Using `break` in a loop
for i = 1, 10 do
  if i == 5 then
    break
  end
  print(i)
end

-- Returning values from functions
local function multiply(a, b)
  return a * b
end
local product = multiply(5, 3)
print("Product: " .. product)

-- Return and Exit in Functions
local function checkValue(val)
  if val > 10 then
    return "Greater than 10"
  else
    return "Not greater than 10"
  end
end
print(checkValue(15))


-- Another File
-- Functions and Return/Break/Continue
local function multiply(a, b)
  return a * b
end
local product = multiply(5, 3)
print("Product: " .. product)

-- Using `break` in a loop
for i = 1, 10 do
  if i == 5 then
    break
  end
  print(i)
end

-- Return and Exit in Functions
local function checkValue(val)
  if val > 10 then
    return "Greater than 10"
  else
    return "Not greater than 10"
  end
end
print(checkValue(15))

-- Function with `goto`
::exit:: -- exit label
print("This is the exit label")
goto exit

-- Method (builtin)
-- String Functions

local str = "Hello Lua"
print(string.len(str))        -- string.len() : Length of the string
print(string.sub(str, 1, 5))  -- string.sub() : Substring
print(string.upper(str))      -- string.upper() : Convert to uppercase
print(string.lower(str))      -- string.lower() : Convert to lowercase
print(string.format("Value: %d", 100)) -- string.format() : Format a string
print(string.match(str, "Lua")) -- string.match() : Match substring

-- Table Functions

local fruits = {"apple", "banana", "cherry"}

-- Insert into table
table.insert(fruits, "orange")
print(table.concat(fruits, ", "))  -- table.concat() : Join table elements into a string

-- Remove from table
table.remove(fruits, 2)    -- Remove element at position 2
print(table.concat(fruits, ", ")) 

-- Sort table
table.sort(fruits)
print(table.concat(fruits, ", "))  -- table.sort() : Sort table

-- Unpack table (convert table to multiple values)
local a, b, c = table.unpack(fruits)
print(a, b, c)  -- table.unpack() : Convert table to variables

-- Math Functions

print(math.abs(-10))    -- math.abs() : Absolute value
print(math.floor(3.7))   -- math.floor() : Round down
print(math.ceil(3.2))    -- math.ceil() : Round up
print(math.max(3, 5, 2)) -- math.max() : Maximum value
print(math.min(3, 5, 2)) -- math.min() : Minimum value
print(math.random())     -- math.random() : Random number

-- Other Functions

local num = 10
local str = "123"

print(type(num))         -- type() : Type of a variable
print(tonumber(str))     -- tonumber() : Convert string to number
print(tostring(num))     -- tostring() : Convert number to string

-- Printing table elements using pairs and ipairs
local person = {name = "John", age = 30}

-- pairs() for iterating over all key-value pairs
for key, value in pairs(person) do
  print(key, value)
end

-- ipairs() for iterating over sequential tables
local fruits = {"apple", "banana", "cherry"}
for index, value in ipairs(fruits) do
  print(index, value)
end

-- OOP in Lua using tables and metatables

-- Define a basic class using a table
local Person = {}
Person.__index = Person  -- set the metatable's __index to Person, for inheritance

-- Constructor for the "Person" class
function Person:new(name, age)
  local instance = setmetatable({}, Person)
  instance.name = name
  instance.age = age
  return instance
end

-- Method for the "Person" class
function Person:speak()
  print("Hi, my name is " .. self.name .. " and I am " .. self.age .. " years old.")
end

-- Inheritance: Define a "Student" class that inherits from "Person"
local Student = setmetatable({}, Person)  -- Inherit from Person
Student.__index = Student  -- set the metatable's __index to Student

-- Constructor for the "Student" class
function Student:new(name, age, grade)
  local instance = Person.new(self, name, age)  -- call Person's constructor
  instance.grade = grade
  return instance
end

-- Method for the "Student" class
function Student:study()
  print(self.name .. " is studying.")
end

-- Create an instance of the "Person" class
local person1 = Person:new("John", 30)
person1:speak()  -- Call the Person method

-- Create an instance of the "Student" class
local student1 = Student:new("Alice", 20, "A")
student1:speak()  -- Inherited method from Person
student1:study()   -- Student-specific method

-- Another example with "Employee" subclassing "Person"
local Employee = setmetatable({}, Person)
Employee.__index = Employee

function Employee:new(name, age, position)
  local instance = Person.new(self, name, age)
  instance.position = position
  return instance
end

function Employee:work()
  print(self.name .. " is working as a " .. self.position)
end

-- Create an instance of the "Employee" class
local employee1 = Employee:new("Bob", 40, "Software Engineer")
employee1:speak()  -- Inherited from Person
employee1:work()   -- Employee-specific method
