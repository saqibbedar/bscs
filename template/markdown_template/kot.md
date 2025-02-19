```kotlin
// Declaration Keywords
val number: Int = 10
var name: String = "Kotlin"
fun greet() {
    println("Hello, Kotlin!")
}

class Person(val name: String)

object Singleton {
    val value = "Singleton"
}

interface Shape {
    fun area(): Double
}

enum class Color { RED, GREEN, BLUE }

sealed class Vehicle
data class Car(val make: String) : Vehicle()

open class Animal(val name: String) {
    open fun speak() = "Some sound"
}

abstract class Machine {
    abstract fun operate()
}

final class FinalClass {
    fun sayHi() = "Hi!"
}

override fun toString(): String {
    return "Kotlin Object"
}

companion object {
    fun create() = FinalClass()
}

constructor(name: String) {
    println("Constructor with name: $name")
}

init {
    println("Initializing class")
}

const val PI = 3.14159

lateinit var lateInitString: String

internal class InternalClass

private class PrivateClass

protected open class ProtectedClass

public class PublicClass

suspend fun longRunningTask() {
    println("Task running")
}

inner class InnerClass

typealias StringList = List<String>

// Control Flow Keywords
if (number > 5) {
    println("Greater than 5")
} else {
    println("Less than or equal to 5")
}

when (number) {
    1 -> println("One")
    else -> println("Other number")
}

for (i in 1..5) {
    println(i)
}

while (number > 0) {
    println(number)
    break
}

do {
    println("Do-while loop")
} while (false)

fun exampleReturn() {
    return
}

throw IllegalArgumentException("Error occurred")

try {
    println("Trying something")
} catch (e: Exception) {
    println("Caught exception")
} finally {
    println("Finally block executed")
}

val isInRange = number in 1..10
val isNotInRange = number !in 1..5

val isString = "Hello" is String
val isNotString = 10 !is String

// Other Keywords
val a: Int by lazy { 10 }
val numbers = listOf(1, 2, 3)
val sum = numbers.sum()

val property: String
    get() = "Property Value"

val fieldExample: Int = 5
var myProperty: String = "Hello"

val receiverExample = "Receiver".let { it.length }

param fun displayMessage(message: String) {
    println(message)
}

setparam fun setPropertyValue(value: Int) {
    println(value)
}

delegate val delegateValue: String by lazy { "Lazy delegate" }

import kotlin.math.*

package myPackage

actual class ActualClass {
    fun display() {
        println("Actual class")
    }
}

expect class ExpectClass {
    fun show()
}

external fun externalFunction()

infix fun Int.add(other: Int) = this + other

inline fun inlineFunction(block: () -> Unit) {
    block()
}

noinline fun noInlineFunction(block: () -> Unit) {
    block()
}

crossinline fun crossInlineFunction(block: () -> Unit) {
    block()
}

reified T : Any fun <T> reifiedExample() {
    println("Reified type: ${T::class.simpleName}")
}

tailrec fun factorial(n: Int, accumulator: Int = 1): Int {
    return if (n == 0) accumulator else factorial(n - 1, n * accumulator)
}

vararg fun sumNumbers(vararg numbers: Int): Int {
    return numbers.sum()
}

annotation class MyAnnotation(val description: String)

operator fun Int.plus(other: Int): Int {
    return this + other
}

```