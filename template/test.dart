// Basic Types

int age = 25;  
double price = 10.99;
String name = "Alice";
bool isActive = true;

dynamic dynamicVar = 10;
var inferredType = "Hello World $isActive";

final int maxLimit = 100;  // constant value
const String appName = "VSCode Theme Test";

Object someObject = Object();
void functionExample() {
  print("This is a function.");
}

Null nullVar = null; 
Never neverType() {
  throw Exception("This will never return");
}

// Type Modifiers
late String description;
required int id;
external String fetchData();
abstract class Animal { }

static const int totalItems = 50;
sealed class SealedClass { }

base class BaseClass { }
interface Runnable { void run(); }

mixin Logging on BaseClass {
  void log(String message) {
    print(message);
  }
}

enum Colors { red, green, blue }

if (isActive) {
  print("The user is active");
} else {
  print("The user is inactive");
}

switch (price) {
  case 10.99:
    print("Price is 10.99");
    break;
  case 20.50:
    print("Price is 20.50");
    break;
  default:
    print("Price is not listed");
}

case "Test Case":
  print("This is a test case");

break;

continue;

return;

throw Exception("An error occurred");

try {
  int result = 10 ~/ 0;  // Integer division by zero
} catch (e) {
  print("Caught an error: $e");
} finally {
  print("This block always runs.");
}

assert(age >= 18, "Age should be 18 or older");

do {
  print("Executing do-while loop");
} while (age < 30);

while (age < 30) {
  print("Age is less than 30");
  age++;
}

for (int i = 0; i < 5; i++) {
  print("Iteration $i");
}

inList: for (var i in [1, 2, 3, 4, 5]) {
  print(i);
}

class Dog extends Animal {
  @override
  void speak() {
    print("Woof");
  }
}

Dog myDog = Dog();
myDog.speak();
super.speak(); // Calls parent method
this.speak(); // Calls this method

new Dog();  // Instantiation of new object
factory Dog.create() {
  return Dog();
}

get ageInDogYears => age * 7;
set setAge(int newAge) => age = newAge;

operator +(int other) {
  return age + other;
}

typedef IntFunction = int Function(int);

// Assignment Operators

int counter = 0;

counter ??= 5;  // Null-aware assignment
counter += 10;   // Addition assignment
counter -= 2;    // Subtraction assignment
counter *= 3;    // Multiplication assignment
counter /= 5;    // Division assignment
counter ~/= 2;   // Integer division assignment
counter %= 4;    // Modulus assignment
counter >>= 1;   // Right shift assignment
counter <<= 2;   // Left shift assignment
counter &= 1;    // Bitwise AND assignment
counter ^= 1;    // Bitwise XOR assignment
counter |= 1;    // Bitwise OR assignment

// Arithmetic Operators

int add = 5 + 3;
int subtract = 5 - 3;
int multiply = 5 * 3;
int divide = 5 / 3;
int integerDivide = 5 ~/ 3;
int modulus = 5 % 3;
int increment = 5;
increment++;
int decrement = 5;
decrement--;

// Remaining

for (int i = 0; i < 5; i++) {
  print(i);
}

in {
  // Iterating over collection or checking conditions.
}

// Basic Types

int age = 25;  
double price = 10.99;
String name = "Alice";
bool isActive = true;

dynamic dynamicVar = 10;
var inferredType = "Hello World";

final int maxLimit = 100;  // constant value
const String appName = "VSCode Theme Test";

Object someObject = Object();
void functionExample() {
  print("This is a function.");
}

Null nullVar = null; 
Never neverType() {
  throw Exception("This will never return");
}

// Type Modifiers
late String description;
required int id;
external String fetchData();
abstract class Animal { }

static const int totalItems = 50;
sealed class SealedClass { }

base class BaseClass { }
interface Runnable { void run(); }

mixin Logging on BaseClass {
  void log(String message) {
    print(message);
  }
}

enum Colors { red, green, blue }

if (isActive) {
  print("The user is active");
} else {
  print("The user is inactive");
}
int x = 10;
int y = x > 20 ? 10 : 20;

switch (price) {
  case 10.99:
    print("Price is 10.99");
    break;
  case 20.50:
    print("Price is 20.50");
    break;
  default:
    print("Price is not listed");
}

case "Test Case":
  print("This is a test case");

break;

continue;

return;

throw Exception("An error occurred");

try {
  int result = 10 ~/ 0;  // Integer division by zero
} catch (e) {
  print("Caught an error: $e");
} finally {
  print("This block always runs.");
}

assert(age >= 18, "Age should be 18 or older");

do {
  print("Executing do-while loop");
} while (age < 30);

while (age < 30) {
  print("Age is less than 30");
  age++;
}

for (int i = 0; i < 5; i++) {
  print("Iteration $i");
}

inList: for (var i in [1, 2, 3, 4, 5]) {
  print(i);
}

class Dog extends Animal {
  @override
  void speak() {
    print("Woof");
  }
}

Dog myDog = Dog();
myDog.speak();
super.speak(); // Calls parent method
this.speak(); // Calls this method

new Dog();  // Instantiation of new object
factory Dog.create() {
  return Dog();
}

get ageInDogYears => age * 7;
set setAge(int newAge) => age = newAge;

operator +(int other) {
  return age + other;
}

typedef IntFunction = int Function(int);

// Assignment Operators

int counter = 0;

counter ??= 5;  // Null-aware assignment
counter += 10;   // Addition assignment
counter -= 2;    // Subtraction assignment
counter *= 3;    // Multiplication assignment
counter /= 5;    // Division assignment
counter ~/= 2;   // Integer division assignment
counter %= 4;    // Modulus assignment
counter >>= 1;   // Right shift assignment
counter <<= 2;   // Left shift assignment
counter &= 1;    // Bitwise AND assignment
counter ^= 1;    // Bitwise XOR assignment
counter |= 1;    // Bitwise OR assignment

// Arithmetic Operators

int add = 5 + 3;
int subtract = 5 - 3;
int multiply = 5 * 3;
int divide = 5 / 3;
int integerDivide = 5 ~/ 3;
int modulus = 5 % 3;
int increment = 5;
increment++;
int decrement = 5;
decrement--;

// Remaining

for (int i = 0; i < 5; i++) {
  print(i);
}

in {
  // Iterating over collection or checking conditions.
}
