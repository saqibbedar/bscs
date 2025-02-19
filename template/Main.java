import java.io.*;  // For File I/O
import java.util.*; // For Collections, Generics, and Utility Classes
import java.util.concurrent.*; // For Multithreading
import java.util.function.*; // For Lambda Expressions

// =============== Main Class ==============
public class Main {
    public static void main(String[] args) throws IOException {
        // ----------------------------------------------------
        // 1. Variables, Operators, and Control Flow
        // ----------------------------------------------------
        int a = 10, b = 3;
        System.out.println("Arithmetic Operators:");
        System.out.println("  a + b = " + (a + b));
        System.out.println("  a - b = " + (a - b));
        System.out.println("  a * b = " + (a * b));
        System.out.println("  a / b = " + (a / b));
        System.out.println("  a % b = " + (a % b));

        System.out.println("\nBitwise Operators:");
        System.out.println("  a & b = " + (a & b));
        System.out.println("  a | b = " + (a | b));
        System.out.println("  a ^ b = " + (a ^ b));
        System.out.println("  a << 1 = " + (a << 1));
        System.out.println("  a >> 1 = " + (a >> 1));

        System.out.println("\nLogical Operators:");
        System.out.println("  (a > b) && (a != b): " + ((a > b) && (a != b)));

        String result = (a > b) ? "a is greater" : "b is greater or equal";
        System.out.println("\nTernary Operator: " + result);

        // ----------------------------------------------------
        // 2. Object-Oriented Programming
        // ----------------------------------------------------
        Animal dog = new Dog("Buddy");
        Animal cat = new Cat("Whiskers");
        dog.speak();
        cat.speak();

        // ----------------------------------------------------
        // 3. Interfaces and Abstract Classes
        // ----------------------------------------------------
        ICalculator calc = new Calculator();
        System.out.println("\nCalculator Interface:");
        System.out.println("  10 + 5 = " + calc.add(10, 5));
        System.out.println("  10 * 5 = " + calc.multiply(10, 5));

        // ----------------------------------------------------
        // 4. Generics
        // ----------------------------------------------------
        GenericBox<Integer> intBox = new GenericBox<>(123);
        GenericBox<String> strBox = new GenericBox<>("Hello Generics");
        System.out.println("\nGenericBox contents:");
        System.out.println("  intBox: " + intBox.getValue());
        System.out.println("  strBox: " + strBox.getValue());

        // ----------------------------------------------------
        // 5. Lambda Expressions & Functional Interfaces
        // ----------------------------------------------------
        Function<Integer, Integer> square = x -> x * x;
        System.out.println("\nLambda Expression:");
        System.out.println("  Square of 5: " + square.apply(5));

        // ----------------------------------------------------
        // 6. Multithreading
        // ----------------------------------------------------
        System.out.println("\nMultithreading:");
        Thread t1 = new Thread(new MyRunnable(), "Thread-1");
        Thread t2 = new Thread(new MyRunnable(), "Thread-2");
        t1.start();
        t2.start();

        // ----------------------------------------------------
        // 7. Exception Handling
        // ----------------------------------------------------
        try {
            int div = divide(10, 0);
            System.out.println("Division result: " + div);
        } catch (ArithmeticException e) {
            System.out.println("Caught exception: " + e.getMessage());
        }

        // ----------------------------------------------------
        // 8. File I/O
        // ----------------------------------------------------
        String filePath = "java_demo.txt";
        FileWriter writer = new FileWriter(filePath);
        writer.write("This is a Java file I/O demo.");
        writer.close();
        BufferedReader reader = new BufferedReader(new FileReader(filePath));
        System.out.println("\nFile I/O:");
        System.out.println("  Content of '" + filePath + "': " + reader.readLine());
        reader.close();
    }

    // Exception Handling Function
    public static int divide(int a, int b) {
        if (b == 0) throw new ArithmeticException("Division by zero error.");
        return a / b;
    }
}

// ----------------------------------------------------
// OOP: Abstract Classes, Inheritance, and Polymorphism
// ----------------------------------------------------
abstract class Animal {
    private final String name;

    public Animal(String name) {
        this.name = name;
    }

    public abstract void speak();

    public String getName() {
        return name;
    }
}

class Dog extends Animal {
    public Dog(String name) {
        super(name);
    }

    @Override
    public void speak() {
        System.out.println(getName() + " says: Woof!");
    }
}

class Cat extends Animal {
    public Cat(String name) {
        super(name);
    }

    @Override
    public void speak() {
        System.out.println(getName() + " says: Meow!");
    }
}

// ----------------------------------------------------
// Interface
// ----------------------------------------------------
interface ICalculator {
    int add(int a, int b);
    int multiply(int a, int b);
}

class Calculator implements ICalculator {
    @Override
    public int add(int a, int b) {
        return a + b;
    }

    @Override
    public int multiply(int a, int b) {
        return a * b;
    }
}

// ----------------------------------------------------
// Generics
// ----------------------------------------------------
class GenericBox<T> {
    private final T value;

    public GenericBox(T value) {
        this.value = value;
    }

    public T getValue() {
        return value;
    }
}

// ----------------------------------------------------
// Multithreading
// ----------------------------------------------------
class MyRunnable implements Runnable {
    @Override
    public void run() {
        System.out.println(Thread.currentThread().getName() + " is running.");
    }
}
