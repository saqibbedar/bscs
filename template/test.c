#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Macro definitions */
#define MAX_SIZE 10
#define SQUARE(x) ((x) * (x))

/* Enum definition */
typedef enum {
    RED,
    GREEN,
    BLUE
} Color;

/* Struct definition */
typedef struct { 
    int id;
    char name[50];
    Color color;
} Item;

typedef struct {
    int id;
    char name[40];
} Item2;

/* Function prototypes */
int factorial(int n);              // Recursion: Factorial calculation
void printArray(int *arr, int size); // Print array contents

/* Main function demonstrating various C features */
int main(void) {
    /* Arithmetic and bitwise operations */
    int a = 10;
    int b = 3;
    int sum = a + b;           // Addition
    int diff = a - b;          // Subtraction
    int prod = a * b;          // Multiplication
    int quotient = a / b;      // Division
    int remainder = a % b;     // Modulo operation
    int bitwiseAnd = a & b;    // Bitwise AND
    int bitwiseOr = a | b;     // Bitwise OR
    int bitwiseXor = a ^ b;    // Bitwise XOR

    printf("Arithmetic operations:\n");
    printf("  %d + %d = %d\n", a, b, sum);
    printf("  %d - %d = %d\n", a, b, diff);
    printf("  %d * %d = %d\n", a, b, prod);
    printf("  %d / %d = %d\n", a, b, quotient);
    printf("  %d %% %d = %d\n", a, b, remainder);

    printf("\nBitwise operations:\n");
    printf("  %d & %d = %d\n", a, b, bitwiseAnd);
    printf("  %d | %d = %d\n", a, b, bitwiseOr);
    printf("  %d ^ %d = %d\n", a, b, bitwiseXor);

    /* Macro usage */
    printf("\nUsing macro SQUARE: %d^2 = %d\n", a, SQUARE(a));

    /* Array and loop demonstration */
    int arr[MAX_SIZE];
    for (int i = 0; i < MAX_SIZE; i++) {
        arr[i] = i * 2;
    }
    printf("\nArray contents:\n");
    printArray(arr, MAX_SIZE);

    /* Recursion: Factorial function */
    int n = 5;
    printf("\nFactorial of %d is %d\n", n, factorial(n));

    /* Using struct and enum */
    Item item1;
    item1.id = 1;
    strcpy(item1.name, "Test Item");
    item1.color = GREEN;
    printf("\nStruct and enum example:\n");
    printf("  Item ID: %d, Name: %s, Color: %d\n", item1.id, item1.name, item1.color);

    /* Dynamic memory allocation */
    int *dynArray = (int *)malloc(5 * sizeof(int));
    if (dynArray == NULL) {
        printf("Memory allocation failed\n");
        return 1;
    }
    for (int i = 0; i < 5; i++) {
        dynArray[i] = i + 10;
    }
    printf("\nDynamically allocated array:\n");
    for (int i = 0; i < 5; i++) {
        printf("  dynArray[%d] = %d\n", i, dynArray[i]);
    }
    free(dynArray);

    /* Conditional (ternary) operator */
    int max = (a > b) ? a : b;
    printf("\nMax of %d and %d is %d\n", a, b, max);

    /* While loop */
    int count = 0;
    printf("\nWhile loop demonstration:\n");
    while (count < 3) {
        printf("  count = %d\n", count);
        count++;
    }

    /* For loop with break and continue */
    printf("\nFor loop with break and continue:\n");
    for (int i = 0; i < 10; i++) {
        if (i == 3)
            continue; // Skip iteration when i is 3
        if (i == 8)
            break;    // Break out of the loop when i is 8
        printf("  i = %d\n", i);
    }

    return 0;
}

/* Recursive factorial function */
int factorial(int n) {
    if (n <= 1)
        return 1;
    else
        return n * factorial(n - 1);
}

/* Function to print an array */
void printArray(int *arr, int size) {
    for (int i = 0; i < size; i++) {
        printf("  arr[%d] = %d\n", i, arr[i]);
    }
}
