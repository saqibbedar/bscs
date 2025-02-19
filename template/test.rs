// Constants
const PI: f64 = 3.14159;

fn main() {
    // Variables
    let number: i32 = 42;
    let greeting: &str = "Hello, Rust!";
    println!("Number: {}", number);
    println!("Greeting: {}", greeting);

    // Data Types
    let integer: i32 = 10;
    let float: f64 = 3.14;
    let string: &str = "Hello, world!";
    let array: [i32; 5] = [1, 2, 3, 4, 5];
    let tuple: (i32, &str) = (30, "Alice");
    let boolean: bool = true;

    // Data Type Output
    println!("Integer: {}", integer);
    println!("Float: {}", float);
    println!("String: {}", string);
    println!("Array: {:?}", array);
    println!("Tuple: {:?}", tuple);
    println!("Boolean: {}", boolean);

    // Control Flow: if-else
    if number > 10 {
        println!("Number is greater than 10");
    } else {
        println!("Number is 10 or less");
    }

    // Control Flow: match
    match number {
        1..=10 => println!("Number is between 1 and 10"),
        11..=20 => println!("Number is between 11 and 20"),
        _ => println!("Number is greater than 20"),
    }

    // Loops
    // For Loop
    for i in 1..=5 {
        println!("For Loop: {}", i);
    }

    // While Loop
    let mut i = 1;
    while i <= 5 {
        println!("While Loop: {}", i);
        i += 1;
    }

    // Functions
    fn add(a: i32, b: i32) -> i32 {
        a + b
    }

    let result = add(5, 10);
    println!("Sum: {}", result);

    // Structs
    struct Person {
        name: String,
        age: u32,
    }

    impl Person {
        fn new(name: String, age: u32) -> Person {
            Person { name, age }
        }

        fn print_details(&self) {
            println!("Name: {}", self.name);
            println!("Age: {}", self.age);
        }
    }

    let person = Person::new("John Doe".to_string(), 30);
    person.print_details();

    // Enums
    enum Direction {
        Up,
        Down,
        Left,
        Right,
    }

    let dir = Direction::Up;
    match dir {
        Direction::Up => println!("Moving Up"),
        Direction::Down => println!("Moving Down"),
        Direction::Left => println!("Moving Left"),
        Direction::Right => println!("Moving Right"),
    }

    // Modules
    mod greetings {
        pub fn say_hello(name: &str) {
            println!("Hello, {}!", name);
        }
    }

    greetings::say_hello("Rust");

    // Error Handling
    fn divide(a: f64, b: f64) -> Result<f64, String> {
        if b == 0.0 {
            Err("Cannot divide by zero".to_string())
        } else {
            Ok(a / b)
        }
    }

    match divide(10.0, 2.0) {
        Ok(result) => println!("Result: {}", result),
        Err(e) => println!("Error: {}", e),
    }

    // Option Types
    let some_number: Option<i32> = Some(10);
    let no_number: Option<i32> = None;

    println!("Some number: {:?}", some_number);
    println!("No number: {:?}", no_number);

    // Closures
    let add = |a: i32, b: i32| -> i32 { a + b };
    let result = add(3, 4);
    println!("Closure Result: {}", result);

    // Iterators
    let numbers = vec![1, 2, 3, 4, 5];
    let sum: i32 = numbers.iter().sum();
    println!("Sum of numbers: {}", sum);

    // Collections: HashMap
    use std::collections::HashMap;

    let mut scores = HashMap::new();
    scores.insert("Alice", 10);
    scores.insert("Bob", 20);

    for (name, score) in &scores {
        println!("{}: {}", name, score);
    }

    // File Handling
    use std::fs::File;
    use std::io::prelude::*;

    let mut file = File::create("sample.txt").expect("Unable to create file");
    file.write_all(b"Hello, Rust File Handling!").expect("Unable to write data");

    let mut file = File::open("sample.txt").expect("Unable to open file");
    let mut contents = String::new();
    file.read_to_string(&mut contents).expect("Unable to read data");
    println!("File Content: {}", contents);

    // Threading
    use std::thread;

    let handle = thread::spawn(|| {
        for i in 1..5 {
            println!("Thread: {}", i);
        }
    });

    handle.join().unwrap();

    // Unsafe Code
    unsafe {
        let x: i32 = 5;
        let y: *const i32 = &x;
        println!("Unsafe: {}", *y);
    }

    // Lifetimes
    fn longest<'a>(s1: &'a str, s2: &'a str) -> &'a str {
        if s1.len() > s2.len() {
            s1
        } else {
            s2
        }
    }

    let s1 = "long string";
    let s2 = "short";
    println!("Longest: {}", longest(s1, s2));
}


fn main() {
    // let and const (variable declarations)
    let mut variable = 10; // mutable variable
    const MAX: i32 = 100;  // constant value
    
    variable += 5;
    println!("Mutable variable: {}", variable);
    println!("Constant MAX: {}", MAX);
    
    // Static variable (lives for the entire program)
    static NAME: &str = "Rust";
    println!("Static variable: {}", NAME);
    
    // Mutability with mut keyword
    let mut x = 5;
    x += 10;
    println!("Mutable x: {}", x);
    
    // Type annotations
    let y: f64 = 10.5; // floating-point number
    println!("Type annotation y: {}", y);
}


// Struct (Custom data type)
struct Person {
    name: String,
    age: u32,
}

impl Person {
    // Associated function (constructor)
    fn new(name: String, age: u32) -> Self {
        Person { name, age }
    }

    // Method (behavior)
    fn greet(&self) {
        println!("Hello, my name is {} and I am {} years old.", self.name, self.age);
    }
}

fn main() {
    let person = Person::new("Alice".to_string(), 30);
    person.greet();
}

// Enum (Enumerated type with variants)
enum Color {
    Red,
    Green,
    Blue,
}

fn describe_color(c: Color) {
    match c {
        Color::Red => println!("The color is Red"),
        Color::Green => println!("The color is Green"),
        Color::Blue => println!("The color is Blue"),
    }
}

fn main() {
    let color = Color::Red;
    describe_color(color);
}

// Trait (Define shared behavior)
trait Drawable {
    fn draw(&self);
}

struct Circle {
    radius: u32,
}

impl Drawable for Circle {
    fn draw(&self) {
        println!("Drawing a circle with radius {}", self.radius);
    }
}

fn main() {
    let circle = Circle { radius: 5 };
    circle.draw();
}


// fn (function definition)
fn add(a: i32, b: i32) -> i32 {
    a + b
}

fn main() {
    let result = add(5, 3);
    println!("The sum is: {}", result);
}

// pub (public function or module)
pub fn public_function() {
    println!("This is a public function.");
}

// self, Self, super (referencing the current struct, type, or parent module)
struct Outer {
    name: String,
}

impl Outer {
    pub fn new(name: String) -> Self {
        Self { name }
    }

    pub fn display(&self) {
        println!("Outer struct name: {}", self.name);
    }
}

struct Inner {
    inner_name: String,
}

impl Inner {
    pub fn new(inner_name: String) -> Self {
        Inner { inner_name }
    }

    pub fn display(&self) {
        println!("Inner struct name: {}", self.inner_name);
    }
    
    pub fn use_outer(&self, outer: &Outer) {
        outer.display();
    }
}

fn main() {
    let outer = Outer::new("Outer object".to_string());
    let inner = Inner::new("Inner object".to_string());
    
    inner.use_outer(&outer); // Using self and super
}

// if, else, match (Pattern matching)
let num = 5;

if num > 10 {
    println!("Greater than 10");
} else {
    println!("Less than or equal to 10");
}

// match (Pattern matching)
let color = Color::Green;
match color {
    Color::Red => println!("Color is Red"),
    Color::Green => println!("Color is Green"),
    Color::Blue => println!("Color is Blue"),
}

// while, for, loop (loops and control)
let mut counter = 0;
while counter < 5 {
    println!("Counter: {}", counter);
    counter += 1;
}

for i in 0..3 {
    println!("For loop index: {}", i);
}

loop {
    println!("Infinite loop");
    break; // Breaking out of infinite loop
}
// move (move ownership of a variable)
fn take_ownership(s: String) {
    println!("Taking ownership: {}", s);
}

fn main() {
    let s = String::from("Rust");
    take_ownership(s); // Ownership is moved
    // println!("{}", s); // This will cause a compile-time error, since s has been moved
}

// ref, mut (reference and mutable reference)
fn change_value(value: &mut i32) {
    *value += 10;
}

fn main() {
    let mut x = 5;
    change_value(&mut x);
    println!("Changed value: {}", x);
}

// async, await (asynchronous programming)
use std::time::Duration;
use tokio;

#[tokio::main]
async fn main() {
    let task = tokio::spawn(async {
        println!("Doing something asynchronously");
    });

    task.await.unwrap();
}

// #[derive()] (deriving common traits automatically)
#[derive(Debug)]
struct MyStruct {
    name: String,
    value: i32,
}

fn main() {
    let my_struct = MyStruct {
        name: String::from("Struct Example"),
        value: 42,
    };
    println!("{:?}", my_struct); // Debug output
}

// #[cfg()] (conditional compilation)
#[cfg(debug_assertions)]
fn debug_only() {
    println!("This is compiled only in debug mode.");
}

#[cfg(not(debug_assertions))]
fn release_only() {
    println!("This is compiled only in release mode.");
}

fn main() {
    debug_only();
    release_only();
}

// #[test] (unit tests)
#[test]
fn test_addition() {
    assert_eq!(2 + 2, 4);
}

// #[macro_use] (macros)
#[macro_use]
extern crate serde_json;

fn main() {
    let data = json!({ "name": "Rust" });
    println!("{}", data);
}


// Arithmetic and logical operators
let a = 10;
let b = 5;

let sum = a + b;
let diff = a - b;
let product = a * b;
let quotient = a / b;
let remainder = a % b;

println!("Sum: {}", sum);
println!("Difference: {}", diff);
println!("Product: {}", product);
println!("Quotient: {}", quotient);
println!("Remainder: {}", remainder);

// Comparison operators
let is_equal = a == b;
let is_not_equal = a != b;
let is_greater = a > b;
let is_less = a < b;
let is_greater_or_equal = a >= b;
let is_less_or_equal = a <= b;

println!("Is equal: {}", is_equal);
println!("Is not equal: {}", is_not_equal);
println!("Is greater: {}", is_greater);
println!("Is less: {}", is_less);
println!("Is greater or equal: {}", is_greater_or_equal);
println!("Is less or equal: {}", is_less_or_equal);

// Logical operators
let and = a > 0 && b > 0;
let or = a > 0 || b > 10;
let not = !(a > 0);

println!("AND: {}", and);
println!("OR: {}", or);
println!("NOT: {}", not);

// Bitwise operators
let and_bitwise = a & b;
let or_bitwise = a | b;
let xor_bitwise = a ^ b;
let left_shift = a << 1;
let right_shift = a >> 1;

println!("Bitwise AND: {}", and_bitwise);
println!("Bitwise OR: {}", or_bitwise);
println!("Bitwise XOR: {}", xor_bitwise);
println!("Left Shift: {}", left_shift);
println!("Right Shift: {}", right_shift);

// println!() (macro for printing with newline)
println!("Hello, world!");

// format!() (macro for formatting strings)
let formatted = format!("The value is: {}", 42);
println!("{}", formatted);

// vec![] (macro to create a vector)
let v = vec![1, 2, 3];
println!("{:?}", v);

// assert!() (macro for assertions)
assert!(true);

// panic!() (macro for causing a panic)
panic!("This will stop the program!");
