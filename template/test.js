// Variable declarations (TypeScript: let, const, var)
let x = 10;               // 'let' variable
const y = "Hello";        // 'const' variable
var z = true;             // 'var' variable

// Classes and Inheritance
class Employee {          // 'class'
  constructor(name, salary) {
    this.name = name;
    this.salary = salary;
  }

  getSalary() {           // 'public'
    return this.salary;
  }

  displayName() {         // 'private' (not enforced in JS)
    console.log(this.name);
  }
}

class Circle extends Employee { // 'extends'
  constructor(radius) {
    super("Default", 0);
    this.radius = radius;
  }

  getArea() {
    return Math.PI * this.radius * this.radius;
  }
}

// Enum (JavaScript doesn't have enums natively, using an object)
const Direction = {
  Up: 1,
  Down: 2,
  Left: 3,
  Right: 4
};


// Functions (JavaScript functions, async/await, generators)
function greetUser(name) {  // 'function'
  console.log(`Hello, ${name}`);
}

async function fetchData() {  // 'async' and 'await'
  let data = await fetch('https://example.com');
  console.log(data);
}

function* generateId() {  // 'yield'
  yield 1;
  yield 2;
  yield 3;
}

// Type assertions are not needed in JavaScript, removing them.

// Optional chaining and Nullish Coalescing (ES2020 features)
let personName = null;
let length = personName?.length ?? 0;  // Optional chaining and Nullish coalescing

// Optional property in objects (Without TypeScript syntax)
const config = { host: "localhost" };

// Comparison Operators
console.log(5 == 5);   // Equal to
console.log(5 === 5);  // Strict equal to
console.log(5 != 6);   // Not equal to
console.log(5 > 4);    // Greater than
console.log(4 < 5);    // Less than
console.log(5 >= 4);   // Greater than or equal to
console.log(4 <= 5);   // Less than or equal to
console.log(5 <=> 5);  // Spaceship operator (JavaScript doesn't support it natively)

// Logical Operators
let a = true;
let b = false;
console.log(a && b);   // AND
console.log(a || b);   // OR
console.log(!a);       // NOT

// Array Methods (using basic JS array methods)
let arr = [1, 2, 3, 4];
console.log(arr.map(x => x * 2));      // Multiplying each element by 2
console.log(arr.filter(x => x % 2 === 0)); // Selecting even numbers
console.log(arr.reduce((acc, x) => acc + x, 0)); // Summing the array
arr.forEach(x => console.log(x));       // Iterating over each element
console.log(arr.sort((a, b) => a - b));  // Sorting array

// String Methods
let str = "hello world";
console.log(str.toUpperCase());  // Convert to uppercase
console.log(str.toLowerCase());  // Convert to lowercase
console.log(str.charAt(0).toUpperCase() + str.slice(1));  // Capitalize first letter
console.log(str.split(" "));     // Split string into array
console.log(str.replace("world", "JavaScript")); // Substitution

// Object/Map Methods
let myHash = { name: "John", age: 30 };
console.log(Object.keys(myHash));   // Returns keys of the hash
console.log(Object.values(myHash)); // Returns values of the hash
for (const [key, value] of Object.entries(myHash)) {  // Iterating over key-value pairs
  console.log(`${key}: ${value}`);
}
console.log({...myHash, city: "New York"});  // Merging another object

// Arrow function to simulate 'this' behavior
const greetArrow = (name) => console.log(`Hello, ${name}`);

// Optional and Nullish
function greet(name) {
  console.log(name ?? "Guest");  // Nullish coalescing
}
greet(null);

// Ternary Operator
let isAdult = 18 >= 18 ? "Adult" : "Minor";
console.log(isAdult);

// Type Checking
console.log(typeof "Hello");  // String
console.log(typeof 10);        // Number
console.log(typeof true);      // Boolean
console.log(typeof undefined); // Undefined
console.log(typeof null);      // Object (this is a known JavaScript oddity)
console.log(typeof {});        // Object
console.log(typeof Symbol());  // Symbol
