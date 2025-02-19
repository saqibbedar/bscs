```R
# This is a single line comment

# 2. Variables and Data Types
numeric_var <- 42       # Numeric
character_var <- "Hello" # Character
logical_var <- TRUE      # Logical (Boolean)
vector_var <- c(1, 2, 3, 4) # Numeric vector
list_var <- list(1, "a", TRUE, 3.14) # List

# 3. Arithmetic Operations
sum <- 5 + 3        # Addition
difference <- 10 - 4  # Subtraction
product <- 7 * 6    # Multiplication
quotient <- 12 / 4   # Division

# 4. Relational Operations
is_equal <- 5 == 5   # Equals
is_not_equal <- 5 != 3  # Not equals
is_greater <- 7 > 3   # Greater than
is_less <- 4 < 10    # Less than

# 5. Logical Operations
and_operation <- TRUE & FALSE # AND
or_operation <- TRUE | FALSE  # OR
not_operation <- !TRUE        # NOT

# 6. Conditional Statements
if (logical_var) {
  print("This is TRUE")
} else {
  print("This is FALSE")
}

# 7. Loops

# For Loop
for (i in 1:5) {
  print(paste("Iteration:", i))
}

# While Loop
counter <- 1
while (counter <= 5) {
  print(paste("Counter:", counter))
  counter <- counter + 1
}

# Repeat Loop (similar to do-while)
counter <- 1
repeat {
  print(paste("Counter:", counter))
  counter <- counter + 1
  if (counter > 5) {
    break
  }
}

# 8. Functions
greet <- function(name) {
  return(paste("Hello,", name))
}

message <- greet("World")
print(message)

# 9. Data Frames
data <- data.frame(
  Name = c("Alice", "Bob", "Charlie"),
  Age = c(25, 30, 35),
  Gender = c("Female", "Male", "Male")
)
print(data)

# 10. Factors
gender_factor <- factor(c("Male", "Female", "Female", "Male"))
print(gender_factor)

# 11. Lists
person <- list(
  name = "John",
  age = 40,
  occupation = "Engineer"
)
print(person)

# 12. Matrices
matrix_var <- matrix(1:9, nrow=3, ncol=3)
print(matrix_var)

# 13. Arrays
array_var <- array(1:8, dim = c(2, 2, 2))
print(array_var)

# 14. Apply Functions
apply(matrix_var, 1, sum) # Sum of rows
apply(matrix_var, 2, sum) # Sum of columns

# 15. File Operations
write.csv(data, file = "data.csv") # Writing to CSV
read_data <- read.csv("data.csv")  # Reading from CSV
print(read_data)

# 16. Plotting (Base R)
plot(data$Age, main="Age Plot", xlab="Index", ylab="Age")

# 17. Packages
# Installing and loading a package
# install.packages("ggplot2")
library(ggplot2)

# 18. Using ggplot2 for advanced plotting
ggplot(data, aes(x=Name, y=Age)) +
  geom_bar(stat="identity", fill="steelblue") +
  theme_minimal()

# 19. Handling NA (Missing) Values
na_data <- c(1, 2, NA, 4, 5)
mean_na <- mean(na_data, na.rm = TRUE) # Mean without NA
print(mean_na)

# 20. Regular Expressions
text <- "The quick brown fox jumps over the lazy dog."
has_quick <- grepl("quick", text)
print(has_quick)

# 21. Date and Time
current_date <- Sys.Date()
current_time <- Sys.time()
print(current_date)
print(current_time)
# If, Else, Repeat, While, Function
x <- 10
if (x > 5) {
  print("x is greater than 5")
} else {
  print("x is less than or equal to 5")
}

# Repeat loop
y <- 1
repeat {
  y <- y + 1
  if (y > 3) break
}
print(y)  # Should print 4

# While loop
z <- 0
while (z < 5) {
  z <- z + 1
  print(z)
}

# Function definition
my_function <- function(a, b) {
  return(a + b)
}
print(my_function(2, 3))  # Should print 5

# For loop and In
for (i in 1:5) {
  print(i)
}

# Next and Break
for (i in 1:5) {
  if (i == 3) next  # Skips iteration when i is 3
  print(i)
  if (i == 4) break  # Exits loop when i is 4
}

# Boolean and special values
print(TRUE)   # TRUE
print(FALSE)  # FALSE
print(NULL)   # NULL
print(Inf)    # Inf
print(NaN)    # NaN
print(NA)     # NA

# Special NA types
print(NA_integer_)  # NA integer
print(NA_real_)     # NA real
print(NA_complex_)  # NA complex
print(NA_character_)  # NA character

# Assignment Operators
a <- 5    # Left assignment
b -> 6    # Right assignment
print(a)
print(b)

# Assignment in function calls
my_function(a = 2, b = 3)  # Passing arguments in function call with `=`

# Global assignment
global_var <<- 100
print(global_var)

# Global right assignment
global_var2 ->> 200
print(global_var2)

# Comparison Operators
x <- 10
y <- 20
print(x == y)  # Equal to
print(x != y)  # Not equal to
print(x > y)   # Greater than
print(x < y)   # Less than
print(x >= y)  # Greater than or equal to
print(x <= y)  # Less than or equal to

# Value matching (%in%)
a <- c(1, 2, 3, 4, 5)
print(3 %in% a)  # TRUE, 3 is in vector a
print(6 %in% a)  # FALSE, 6 is not in vector a

# Matrix multiplication (%*%)
matrix1 <- matrix(1:4, nrow = 2)
matrix2 <- matrix(5:8, nrow = 2)
result <- matrix1 %*% matrix2
print(result)  # Matrix multiplication result

# Sequence generator (:)
seq <- 1:5
print(seq)  # Sequence from 1 to 5

# List/DataFrame element ($)
my_list <- list(name = "John", age = 30)
print(my_list$name)  # Accessing the 'name' element in the list

# Slot access (@) for S4 objects
setClass("Person", slots = c(name = "character", age = "numeric"))
person <- new("Person", name = "Alice", age = 25)
print(person@name)  # Access the 'name' slot in the S4 object

# Namespace access (::)
print(stats::mean(c(1, 2, 3, 4, 5)))  # Accessing the 'mean' function from the 'stats' package

# Internal namespace access (:::) 
# This is typically used to access internal functions not exported in a package.
# In general usage, it's not recommended to use ::: as it accesses internal non-exported functions.
# print(stats:::some_internal_function())  # This line is commented because internal functions are not typically meant to be called


# 22. Scripting Control
args <- commandArgs(trailingOnly = TRUE)
if (length(args) > 0) {
  print(paste("Arguments passed:", args))
} else {
  print("No arguments passed.")
}

```