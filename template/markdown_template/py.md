```py
# Importing libraries

import math

# Constants
PI = 3.14159

# Function definitions
def greet(name):
    """Greets the user with the given name."""
    print(f"Hello, {name}!")

def add(a, b):
    """Returns the sum of two numbers."""
    return a + b

def is_even(number):
    """Checks if a number is even."""
    return number % 2 == 0

def factorial(n):
    """Calculates the factorial of a number using recursion."""
    if n == 0 or n == 1:
        return 1
    else:
        return n * factorial(n - 1)

def calculate_area_of_circle(radius):
    """Calculates the area of a circle."""
    return PI * radius ** 2

def check_grade(score):
    """Returns the grade based on the score."""
    if score >= 90:
        return 'A'
    elif score >= 80:
        return 'B'
    elif score >= 70:
        return 'C'
    elif score >= 60:
        return 'D'
    else:
        return 'F'

# Classes
class Animal:
    """A simple Animal class."""
    def __init__(self, name, species):
        self.name = name
        self.species = species

    def make_sound(self):
        return "Some generic sound"

class Dog(Animal):
    """Dog class inheriting from Animal."""
    def __init__(self, name, breed):
        super().__init__(name, species="Dog")
        self.breed = breed

    def make_sound(self):
        return "Woof!"

# Control flow examples
def control_flow_examples():
    # For loop
    for i in range(5):
        print(f"Loop iteration {i}")

    # While loop
    count = 0
    while count < 5:
        print(f"Count is {count}")
        count += 1

    # If-else statement
    x = 10
    if x > 5:
        print(f"{x} is greater than 5")
    else:
        print(f"{x} is not greater than 5")

    # Try-except for error handling
    try:
        result = 10 / 0
    except ZeroDivisionError as e:
        print(f"Error occurred: {e}")

    # Using break and continue in loops
    for i in range(10):
        if i == 5:
            continue
        if i == 8:
            break
        print(i)

# List comprehension

squares = [x**2 for x in range(10)]

# Dictionary comprehension
square_dict = {x: x**2 for x in range(10)}

# Using lambda function
multiply = lambda x, y: x * y

# Function to test everything
def main():
    # Print greetings
    greet("Alice")

    # Adding numbers
    print(f"10 + 5 = {add(10, 5)}")

    # Check if a number is even
    number = 4
    print(f"Is {number} even? {is_even(number)}")

    # Calculate factorial
    print(f"Factorial of 5 is {factorial(5)}")

    # Calculate area of circle
    radius = 7
    print(f"Area of circle with radius {radius} is {calculate_area_of_circle(radius)}")

    # Check grade
    score = 85
    print(f"Grade for score {score} is {check_grade(score)}")

    # Control flow examples
    control_flow_examples()

    # Using classes
    dog = Dog(name="Buddy", breed="Golden Retriever")
    print(f"{dog.name} is a {dog.breed} and it says {dog.make_sound()}")

    # Using lambda function
    print(f"5 * 3 = {multiply(5, 3)}")

    # Print squares list
    print(f"Squares: {squares}")

    # Print square dictionary
    print(f"Square dictionary: {square_dict}")

# Run the main function
if __name__ == "__main__":
    main()

arr = [10, 20, "30"]


from typeguard import typechecked

@typechecked
class Student:
    def __init__(self, name: str) -> None:
        self.name: str = name

    def show(self) -> None:
        print(f"Student Name: {self.name}")

@typechecked
class Graduate(Student):
    def __init__(self, name: str, thesis_title: str) -> None:
        super().__init__(name)
        self.thesis_title: str = thesis_title

    def show(self) -> None:
        print(f"Graduate Student: {self.name}")
        print(f"Thesis Title: {self.thesis_title}")

# Debugging test
if __name__ == "__main__":
    student = Student("Alice")
    student.show()

    graduate = Graduate("Bob", "AI in Healthcare")
    graduate.show()
```