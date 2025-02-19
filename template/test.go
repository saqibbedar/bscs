// Package declaration
package main

// Importing packages
import (
	"fmt"
	"time"
	"errors"
	"math"
	"sort"
)

// Constants
const Pi = 3.14159

// Type declaration
type Person struct {
	Name string
	Age  int
}

// Interface declaration
type Shape interface {
	Area() float64
	Perimeter() float64
}

// Struct implementing the Shape interface
type Circle struct {
	Radius float64
}

func (c Circle) Area() float64 {
	return Pi * c.Radius * c.Radius
}

func (c Circle) Perimeter() float64 {
	return 2 * Pi * c.Radius
}

// Struct without an interface
type Rectangle struct {
	Width, Height float64
}

func (r Rectangle) Area() float64 {
	return r.Width * r.Height
}

func (r Rectangle) Perimeter() float64 {
	return 2 * (r.Width + r.Height)
}

// A simple function
func add(a int, b int) int {
	return a + b
}

// A function with multiple return values
func divide(a, b float64) (float64, error) {
	if b == 0 {
		return 0, errors.New("division by zero")
	}
	return a / b, nil
}

// Variadic function
func sum(nums ...int) int {
	total := 0
	for _, num := range nums {
		total += num
	}
	return total
}

// Function returning another function (closure)
func multiplier(factor int) func(int) int {
	return func(x int) int {
		return x * factor
	}
}

// Control flows: if, else, switch, for
func controlFlows(x int) {
	if x < 0 {
		fmt.Println("Negative")
	} else if x == 0 {
		fmt.Println("Zero")
	} else {
		fmt.Println("Positive")
	}

	switch x {
	case 1:
		fmt.Println("One")
	case 2:
		fmt.Println("Two")
	default:
		fmt.Println("Other number")
	}

	for i := 0; i < x; i++ {
		fmt.Println(i)
	}
}

// Working with arrays
func arraysExample() {
	var arr [3]int // Declaring an array of integers
	arr[0] = 1
	arr[1] = 2
	arr[2] = 3
	fmt.Println(arr)
}

// Working with slices
func slicesExample() {
	slice := []int{1, 2, 3, 4, 5}
	fmt.Println(slice)
	slice = append(slice, 6) // Appending to a slice
	fmt.Println(slice)

	// Slicing a slice
	subSlice := slice[2:4]
	fmt.Println(subSlice)
}

// Working with maps
func mapsExample() {
	m := map[string]int{
		"foo": 1,
		"bar": 2,
	}
	fmt.Println(m)
	fmt.Println(m["foo"])

	// Checking existence in map
	value, ok := m["baz"]
	if ok {
		fmt.Println(value)
	} else {
		fmt.Println("key 'baz' not found")
	}
}

// Goroutines example
func printMessage(message string) {
	for i := 0; i < 3; i++ {
		fmt.Println(message)
		time.Sleep(time.Millisecond * 100)
	}
}

// Channels example
func sumChannel(nums []int, resultChan chan int) {
	sum := 0
	for _, num := range nums {
		sum += num
	}
	resultChan <- sum
}

func main() {
	// Variable declarations
	var a int = 5
	b := 10 // Short variable declaration

	// Constants
	const phi = 1.618

	// Function calls
	fmt.Println("Add:", add(a, b))
	result, err := divide(10, 2)
	if err != nil {
		fmt.Println("Error:", err)
	} else {
		fmt.Println("Divide:", result)
	}

	fmt.Println("Sum:", sum(1, 2, 3, 4, 5))

	// Using a closure
	timesTwo := multiplier(2)
	fmt.Println("Times Two:", timesTwo(5))

	// Control flow
	controlFlows(3)

	// Working with structs
	p := Person{Name: "John", Age: 30}
	fmt.Println(p)

	// Using interfaces
	c := Circle{Radius: 5}
	fmt.Println("Circle Area:", c.Area())
	fmt.Println("Circle Perimeter:", c.Perimeter())

	r := Rectangle{Width: 4, Height: 5}
	fmt.Println("Rectangle Area:", r.Area())
	fmt.Println("Rectangle Perimeter:", r.Perimeter())

	// Arrays and Slices
	arraysExample()
	slicesExample()

	// Maps
	mapsExample()

	// Goroutines
	go printMessage("Hello from goroutine 1")
	go printMessage("Hello from goroutine 2")

	// Channels
	nums := []int{1, 2, 3, 4, 5}
	resultChan := make(chan int)
	go sumChannel(nums, resultChan)
	resultSum := <-resultChan
	fmt.Println("Sum from channel:", resultSum)

	// Waiting for goroutines to finish
	time.Sleep(time.Second * 1)

	// Using the math package
	fmt.Println("Square root of 16:", math.Sqrt(16))

	// Sorting a slice
	slice := []int{5, 3, 1, 4, 2}
	sort.Ints(slice)
	fmt.Println("Sorted slice:", slice)

	// Error handling
	_, err = divide(10, 0)
	if err != nil {
		fmt.Println("Caught an error:", err)
	}
}
