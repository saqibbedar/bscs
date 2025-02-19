```php
<?php

// ==========================
// 1. Variables & Data Types
// ==========================
$intVar = 10;
$floatVar = 10.5;
$stringVar = "Hello, PHP!";
$boolVar = true;
$arrayVar = [1, 2, 3, "four"];
$nullVar = null;

// ==========================
// 2. Operators & Control Flow
// ==========================
$sum = $intVar + 5; // Arithmetic
$andResult = $intVar & 5; // Bitwise AND
$logical = ($intVar > 5) && ($floatVar < 20); // Logical

// Conditional Statement
if ($sum > 10) {
    echo "Sum is greater than 10\n";
} else {
    echo "Sum is 10 or less\n";
}

// Looping
for ($i = 1; $i <= 3; $i++) {
    echo "Loop iteration: $i\n";
}

// Switch-case
switch ($intVar) {
    case 10:
        echo "Variable is 10\n";
        break;
    default:
        echo "Variable is something else\n";
}

// ==========================
// 3. Functions
// ==========================
function add($a, $b) {
    return $a + $b;
}
echo "Addition: " . add(5, 7) . "\n";

// Anonymous Function
$multiply = function ($x, $y) {
    return $x * $y;
};
echo "Multiplication: " . $multiply(4, 3) . "\n";

// Arrow Function
$power = fn($x, $y) => $x ** $y;
echo "Power: " . $power(2, 3) . "\n";

// ==========================
// 4. OOP: Classes & Objects
// ==========================

// Abstract Class
abstract class Animal {
    protected $name;

    public function __construct($name) {
        $this->name = $name;
    }

    abstract public function speak();
}

// Interface
interface Pet {
    public function showAffection();
}

// Trait (Code Reusability)
trait CanRun {
    public function run() {
        echo "$this->name is running...\n";
    }
}

// Inheritance & Polymorphism
class Dog extends Animal implements Pet {
    use CanRun;

    public function speak() {
        echo "$this->name says: Woof! 🐶\n";
    }

    public function showAffection() {
        echo "$this->name wags tail happily!\n";
    }
}

$dog = new Dog("Buddy");
$dog->speak();
$dog->showAffection();
$dog->run();

// ==========================
// 5. Error Handling
// ==========================
function divide($a, $b) {
    try {
        if ($b == 0) {
            throw new Exception("Division by zero error!");
        }
        return $a / $b;
    } catch (Exception $e) {
        echo "Caught Exception: " . $e->getMessage() . "\n";
    } finally {
        echo "Error handling completed.\n";
    }
}
echo "Division: " . divide(10, 0) . "\n";

// ==========================
// 6. File I/O
// ==========================
$file = "test.txt";
file_put_contents($file, "Hello, PHP File I/O!");
$content = file_get_contents($file);
echo "File Content: $content\n";

// ==========================
// 7. Multithreading (Requires `pthreads` extension)
// ==========================
if (class_exists("Thread")) {
    class MyThread extends Thread {
        public function run() {
            echo "Running in a separate thread...\n";
        }
    }

    $thread = new MyThread();
    $thread->start();
    $thread->join();
} else {
    echo "Multithreading not supported (pthreads extension required).\n";
}

?>
```