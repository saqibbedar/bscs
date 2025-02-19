// Type Keywords
let x: number = 10;               // 'let' variable
const y: string = "Hello";        // 'const' variable
var z: boolean = true;            // 'var' variable
type ID = string;                 // 'type' alias
interface Person {                // 'interface'
  name: string;
  age: number;
}
const obj = {
  name: "Saqib"
}
enum Direction {                  // 'enum'
  Up = 1,
  Down, 
  Left,
  Right
}

class Employee {                  // 'class'
  constructor(public name: string, private salary: number) {}
  
  public getSalary() {            // 'public'
    return this.salary;
  }

  private displayName() {         // 'private'
    console.log(this.name);
  }
}

abstract class Shape {            // 'abstract' class
  abstract getArea(): number;
}

class Circle extends Shape {       // 'implements' and 'extends'
  constructor(public radius: number) {
    super();
  }

  getArea(): number {
    return Math.PI * this.radius * this.radius;
  }
}

interface Car {                   // 'interface' and 'implements'
  speed: number;
}

class SportsCar implements Car {
  speed: number = 200;
}

readonly id: number = 123;        // 'readonly'
static totalCars: number = 0;     // 'static'

namespace MyNamespace {           // 'namespace'
  export function greet(name: string) {
    console.log(`Hello, ${name}`);
  }
}

module MyModule {                 // 'module'
  export const version = "1.0.0";
}

declare var window: any;          // 'declare'

// Basic Types
let name: string = "John";        // 'string'
let age: number = 30;             // 'number'
let isEmployed: boolean = true;   // 'boolean'
let unknownValue: unknown = "unknown"; // 'unknown'
let someObject: object = {};      // 'object'
let uniqueSymbol: symbol = Symbol("id"); // 'symbol'
let bigNumber: bigint = 12345678901234567890n; // 'bigint'
let nothing: null = null;         // 'null'
let notDefined: undefined = undefined; // 'undefined'
let anyValue: any = "anything";   // 'any'
let neverValue: never;            // 'never', used for functions that never return
let voidValue: void = undefined;  // 'void'

// Union and Intersection Types
let unionValue: string | number = "Hello"; // '|' Union type
let intersectionValue: { name: string } & { age: number } = { name: "John", age: 30 }; // '&' Intersection type

// Control Flow
if (age > 18) {                   // 'if' condition
  console.log("Adult");
} else {                          // 'else' condition
  console.log("Minor");
}

switch (Direction.Up) {           // 'switch' and 'case'
  case Direction.Up:
    console.log("Going Up");
    break;
  case Direction.Down:
    console.log("Going Down");
    break;
  default:                        // 'default'
    console.log("Unknown direction");
}

try {                             // 'try'
  throw new Error("An error occurred!"); // 'throw'
} catch (error) {                  // 'catch'
  console.log(error);
} finally {                        // 'finally'
  console.log("Execution finished");
}

// Functions
function greetUser(name: string): void {  // 'function'
  console.log(`Hello, ${name}`);
}

async function fetchData(): Promise<void> {  // 'async' and 'await'
  let data = await fetch('https://example.com');
  console.log(data);
}

function* generateId(): Generator<number> {  // 'yield'
  yield 1;
  yield 2;
  yield 3;
}

let newEmployee = new Employee("John Doe", 50000);  // 'new'
console.log(newEmployee.getSalary());

class CarModel extends SportsCar {  // 'extends'
  constructor() {
    super();
    console.log(`Car speed: ${this.speed}`);
  }
}

// Type Assertions
let userInput: any = "123";
let numericValue: number = <number>userInput; // '<Type>' Angle-bracket assertion
let anotherNumericValue: number = userInput as number; // 'as' Type assertion

// Optional and Nullish
interface Config {
  host?: string;         // '?' Optional property
  port?: number;         // '?' Optional property
}

let config: Config = { host: "localhost" };  // 'host' is optional

let personName: string | null = null;
let length = personName?.length ?? 0;  // '?.' Optional chaining and '??' Nullish coalescing

function greet(name: string | null) {
  console.log(name ?? "Guest");  // '??' Nullish coalescing
}
greet(null);
