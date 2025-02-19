-- Importing a module
import Data.List (sort)

-- Defining a data type
data Shape = Circle Float | Rectangle Float Float deriving Show

-- Function with pattern matching
area :: Shape -> Float
area (Circle r) = pi * r * r
area (Rectangle w h) = w * h

-- Recursive function (factorial)
factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- Higher-order function (map)
doubleList :: [Int] -> [Int]
doubleList = map (*2)

-- List comprehension
evens :: [Int] -> [Int]
evens xs = [x | x <- xs, even x]

-- Lambda function
square :: Int -> Int
square = \x -> x * x

-- Main function
main :: IO ()
main = do
    putStrLn "Testing Haskell Syntax"
    print (area (Circle 5))
    print (area (Rectangle 4 6))
    print (factorial 5)
    print (doubleList [1,2,3,4])
    print (evens [1..10])
    print (square 6)
