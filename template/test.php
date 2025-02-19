<?php

// PHP Basic Syntax and Operators

// Simple Variables
$intVar = 10;             // Integer
$doubleVar = 10.5;        // Double
$stringVar = "Hello";     // String
$boolVar = true;          // Boolean
$arrayVar = [1, 2, 3];    // Array
$nullVar = null;          // Null

// Operators
$sum = 10 + 5;            // Addition
$diff = 10 - 5;           // Subtraction
$product = 10 * 5;        // Multiplication
$quotient = 10 / 5;       // Division
$mod = 10 % 3;            // Modulus
$exp = 2 ** 3;            // Exponentiation
$increment = ++$intVar;   // Increment
$decrement = --$intVar;   // Decrement

// Assignment Operators
$assign = 5;              // Assignment
$assign += 5;             // Addition assignment
$assign -= 3;             // Subtraction assignment
$assign *= 2;             // Multiplication assignment
$assign /= 2;             // Division assignment
$assign %= 2;             // Modulus assignment
$str = "Hello";
$str .= " World";         // String concatenation assignment
$assign ??= 10;           // Null coalescing assignment (PHP 7.4+)

// Comparison Operators
$isEqual = 10 == 10;      // Equal
$isIdentical = 10 === "10";  // Identical
$isNotEqual = 10 != 5;    // Not equal
$isNotIdentical = 10 !== "10"; // Not identical
$isLessThan = 10 < 20;    // Less than
$isGreaterThan = 20 > 10; // Greater than
$isLessThanOrEqual = 10 <= 20; // Less than or equal
$isGreaterThanOrEqual = 20 >= 10; // Greater than or equal
$spaceship = 10 <=> 5;    // Spaceship operator
$nullCoalescing = $nonExistingVar ?? "default"; // Null coalescing

// Conditional Statements
if ($intVar > 5) {
    echo "Greater than 5";
} elseif ($intVar == 5) {
    echo "Equal to 5";
} else {
    echo "Less than 5";
}

// Switch Statement
switch ($intVar) {
    case 1:
        echo "One";
        break;
    case 2:
        echo "Two";
        break;
    default:
        echo "Other";
        break;
}

// Loops
while ($intVar < 15) {
    $intVar++;
    echo $intVar;
}

do {
    $intVar++;
} while ($intVar < 20);

for ($i = 0; $i < 5; $i++) {
    echo $i;
}

foreach ($arrayVar as $value) {
    echo $value;
}

// Goto Example (not recommended in most cases)
goto label;
label:
echo "This is the label";

// PHP Function Example
function testFunction($param1, $param2) {
    return $param1 + $param2;
}
echo testFunction(3, 4);  // Calls the function

?>


<!-- Second -->
 <?php

// PHP Object-Oriented Programming

// Person Class (Parent Class)
class Person {
    public $name;
    public $age;

    // Constructor
    public function __construct($name, $age) {
        $this->name = $name;
        $this->age = $age;
    }

    // Method
    public function speak() {
        echo "Hello, my name is $this->name and I am $this->age years old.";
    }
}

// Student Class (Child Class)
class Student extends Person {
    public $grade;

    // Constructor
    public function __construct($name, $age, $grade) {
        parent::__construct($name, $age); // Calling the parent constructor
        $this->grade = $grade;
    }

    // Method
    public function study() {
        echo "$this->name is studying for grade $this->grade.";
    }
}

// Instantiate Person Object
$person1 = new Person("John", 30);
$person1->speak();

// Instantiate Student Object
$student1 = new Student("Alice", 20, "A");
$student1->speak();
$student1->study();

// Interface Example
interface TeacherInterface {
    public function teach();
}

class Teacher implements TeacherInterface {
    public function teach() {
        echo "Teaching...";
    }
}

$teacher = new Teacher();
$teacher->teach();

?>

<!-- third -->
 <?php

// PHP Namespaces and Traits

// Define a namespace
namespace MyNamespace {

    class MyClass {
        public function hello() {
            echo "Hello from MyClass in MyNamespace!";
        }
    }

    function myFunction() {
        echo "Hello from function in MyNamespace!";
    }

}

// Usage of namespace
use MyNamespace\MyClass;
use MyNamespace\myFunction;

$obj = new MyClass();
$obj->hello();

myFunction();

// Traits
trait MyTrait {
    public function traitMethod() {
        echo "Method from trait!";
    }
}

// Class using Trait
class MyClassWithTrait {
    use MyTrait;
}

$objWithTrait = new MyClassWithTrait();
$objWithTrait->traitMethod();

?>

<!-- fourth -->

<?php

// PHP Exception Handling

try {
    // Code that might throw an exception
    $dividend = 10;
    $divisor = 0;
    if ($divisor == 0) {
        throw new Exception("Division by zero error");
    }
    $result = $dividend / $divisor;
} catch (Exception $e) {
    // Handling the exception
    echo 'Caught exception: ',  $e->getMessage(), "\n";
} finally {
    echo "This will always run.";
}

?>

<?php

// PHP File Operations

// Including files
include 'file1.php'; // Includes a file (file1.php should exist in the same directory)
require 'file2.php'; // Similar to include but throws a fatal error if file is not found

// Using clone keyword
class Car {
    public $color;
    public function __clone() {
        $this->color = "Blue"; // Cloning method
    }
}

$car1 = new Car();
$car1->color = "Red";
$car2 = clone $car1;
echo $car2->color;  // Blue

// Evaluating PHP code with eval()
eval('$x = 5; echo $x;');  // Executes PHP code as a string

?>
