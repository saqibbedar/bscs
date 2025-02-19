import Foundation

// Constants
let pi: Double = 3.14159

// Variables
var number: Int = 42
var greeting: String = "Hello, Swift!"
print("Number: \(number)")
print("Greeting: \(greeting)")

// Arrays
let fruits: [String] = ["apple", "banana", "cherry"]
print("First fruit: \(fruits[0])")
print("All fruits: \(fruits)")

// Dictionaries
var colors: [String: String] = [
    "red": "#FF0000",
    "green": "#00FF00",
    "blue": "#0000FF"
]
print("Red color code: \(colors["red"] ?? "unknown")")

// Control Flow: if-else
if number > 10 {
    print("Number is greater than 10")
} else {
    print("Number is 10 or less")
}

// Control Flow: switch
switch number {
case 1, 2, 3, 4, 5:
    print("Number is between 1 and 5")
case 6, 7, 8, 9, 10:
    print("Number is between 6 and 10")
default:
    print("Number is greater than 10")
}

// Loops
// For Loop
for i in 1...5 {
    print("For Loop: \(i)")
}

// While Loop
var i = 1
while i <= 5 {
    print("While Loop: \(i)")
    i += 1
}

// Functions
func add(a: Int, b: Int) -> Int {
    return a + b
}

let result = add(a: 5, b: 10)
print("Sum: \(result)")

// Functions with default values
func greet(name: String = "World") {
    print("Hello, \(name)!")
}

greet(name: "Alice")
greet()

// Handling User Input (Requires command-line application)
print("Enter your name: ", terminator: "")
if let name = readLine() {
    print("Hello, \(name)!")
}

// String Operations
let str = "Hello, Swift!"
print("Length of string: \(str.count)")
print("Substring: \(str.dropFirst(7).prefix(4))")

// Optionals
var optionalString: String? = "I am optional"
print("Optional String: \(optionalString ?? "nil")")
optionalString = nil
print("Optional String after nil assignment: \(optionalString ?? "nil")")

// Enumerations
enum Direction {
    case north
    case south
    case east
    case west
}

let direction: Direction = .north
switch direction {
case .north:
    print("Heading north")
case .south:
    print("Heading south")
case .east:
    print("Heading east")
case .west:
    print("Heading west")
}

// Classes and Structs
class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func greet() {
        print("Hello, my name is \(name).")
    }
}

struct Rectangle {
    var width: Double
    var height: Double
    
    func area() -> Double {
        return width * height
    }
}

let person = Person(name: "Alice")
person.greet()

let rectangle = Rectangle(width: 5.0, height: 10.0)
print("Rectangle area: \(rectangle.area())")

// Error Handling
enum MathError: Error {
    case divisionByZero
}

func divide(_ numerator: Int, by denominator: Int) throws -> Int {
    if denominator == 0 {
        throw MathError.divisionByZero
    }
    return numerator / denominator
}

do {
    let result = try divide(10, by: 2)
    print("Division result: \(result)")
} catch MathError.divisionByZero {
    print("Error: Division by zero")
} catch {
    print("Unexpected error: \(error)")
}

// Closures
let greetClosure: (String) -> Void = { name in
    print("Hello, \(name) from closure!")
}

greetClosure("Bob")

// Asynchronous code (Swift 5.5+)
import Foundation

func fetchData(completion: @escaping (String) -> Void) {
    DispatchQueue.global().async {
        sleep(2)
        completion("Data fetched")
    }
}

fetchData { result in
    print(result)
}

print("Fetching data...")

// Exit
print("Script completed.")
