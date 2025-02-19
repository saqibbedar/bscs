```lua
-- Keywords demonstration in Lua

-- local: Declare local variables
local x = 10
local y = 5

-- if, elseif, else: Conditional statements
if x > y then
    print("x is greater than y")
elseif x < y then
    print("x is less than y")
else
    print("x is equal to y")
end

-- and, or: Logical operators
if x > 0 and y > 0 then
    print("Both x and y are positive")
end

if x > 0 or y > 0 then
    print("At least one of x or y is positive")
end

-- not: Logical negation
if not (x < 5) then
    print("x is not less than 5")
end

-- true, false: Boolean values
if true then
    print("This is always true")
end

if false then
    print("This will never be printed")
end

-- while, repeat...until: Loops
local i = 0
while i < 5 do
    i = i + 1
    print("While loop, i is " .. i)
end

local j = 0
repeat
    j = j + 1
    print("Repeat loop, j is " .. j)
until j >= 5

-- for: Looping over a range
for i = 1, 5 do
    print("For loop, i is " .. i)
end

-- function: Defining functions
function greet(name)
    print("Hello, " .. name)
end

greet("Lua")

-- return: Returning from a function
function add(a, b)
    return a + b
end

local sum = add(3, 4)
print("Sum is: " .. sum)

-- goto: Jumping to a label
::start::
print("This is the start label.")
goto start

-- break: Exiting a loop early
for i = 1, 10 do
    if i == 5 then
        print("Breaking the loop at i = " .. i)
        break
    end
end

-- in: Iterating over a table
for key, value in pairs({name = "Lua", type = "language"}) do
    print(key .. ": " .. value)
end

-- nil: Special value representing "no value"
local myVar = nil
if myVar == nil then
    print("myVar is nil")
end

-- end: Closing structures (if, function, etc.)
-- This will automatically be added at the end of conditionals, functions, etc.

-- Example of using local and function together
local function multiply(a, b)
    return a * b
end

print("Product is: " .. multiply(2, 3))

-- else: Used for alternative logic in conditionals
if x > 15 then
    print("x is greater than 15")
else
    print("x is not greater than 15")
end

-- elseif: Used for multiple conditions in an if-else chain
if x > 10 then
    print("x is greater than 10")
elseif x == 10 then
    print("x is equal to 10")
else
    print("x is less than 10")
end

-- until: Used in repeat-until loops, as shown earlier

-- end: Always marks the end of the blocks (loops, ifs, functions)

```