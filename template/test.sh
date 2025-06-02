#!/bin/bash

# Constants
PI=3.14159
readonly PI

# Variables
number=42
greeting="Hello, Bash!"
echo "Number: $number"
echo "Greeting: $greeting"

# Arrays
fruits=("apple" "banana" "cherry")
echo "First fruit: ${fruits[0]}"
echo "All fruits: ${fruits[@]}"

# Associative Arrays (Bash 4.0+)
declare -A colors
colors[red]="#FF0000"
colors[green]="#00FF00"
colors[blue]="#0000FF"
echo "Red color code: ${colors[red]}"

# Control Flow: if-else
if [ $number -gt 10 ]; then
    echo "Number is greater than 10"
else
    echo "Number is 10 or less"
fi

# Control Flow: case
case $number in
    1|2|3|4|5)
        echo "Number is between 1 and 5"
        ;;
    6|7|8|9|10)
        echo "Number is between 6 and 10"
        ;;
    *)
        echo "Number is greater than 10"
        ;;
esac

# Loops
# For Loop
for i in {1..5}; do
    echo "For Loop: $i"
done

# While Loop
i=1
while [ $i -le 5 ]; do
    echo "While Loop: $i"
    ((i++))
done

# Functions
function add() {
    local a=$1
    local b=$2
    echo $((a + b))
}

result=$(add 5 10)
echo "Sum: $result"

# Functions with default values
function greet() {
    local name=${1:-"World"}
    echo "Hello, $name!"
}

greet "Alice"
greet

# Handling User Input
read -p "Enter your name: " name
echo "Hello, $name!"

# File Handling
echo "Creating and writing to a file..."
echo "Hello, File Handling!" > sample.txt
cat sample.txt

# String Operations
str="Hello, Bash!"
echo "Length of string: ${#str}"
echo "Substring: ${str:7:4}"

# Process Substitution
echo "Current Date and Time:"
date

# Command Substitution
current_user=$(whoami)
echo "Current User: $current_user"

# Error Handling
if ! cp non_existent_file.txt destination.txt; then
    echo "Error: Could not copy file"
fi

# Exit Status
if [ $? -eq 0 ]; then
    echo "Last command was successful"
else
    echo "Last command failed"
fi

# Background Jobs
echo "Starting background job..."
sleep 5 &
job_pid=$!
echo "Background job PID: $job_pid"
wait $job_pid
echo "Background job completed"

# Signal Handling
trap 'echo "SIGINT received. Exiting..."; exit' SIGINT

# Exit
echo "Script completed."
exit 0
