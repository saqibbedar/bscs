```ps1
$PSVersionTable  # PowerShell version information
$PWD            # Current working directory
$HOME           # User's home directory
$Error          # Array of error objects
$PSScriptRoot   # Script's directory path
$PSCommandPath  # Script's file path
$Args           # Array of arguments
$PSBoundParameters # Hashtable of bound parameters


# Function with parameters
function MyFunction {
    param (
        [int]$x,
        [int]$y
    )
    return $x + $y
}

# Begin, Process, End (in advanced functions)
function MyAdvancedFunction {
    param ($inputValue)
    
    begin {
        Write-Host "Starting function"
    }
    
    process {
        Write-Host "Processing: $inputValue"
    }
    
    end {
        Write-Host "Ending function"
    }
}

# If, ElseIf, Else
$number = 10
if ($number -eq 10) {
    Write-Host "Number is 10"
} elseif ($number -eq 5) {
    Write-Host "Number is 5"
} else {
    Write-Host "Number is something else"
}

# Switch
$day = "Monday"
switch ($day) {
    "Monday" { Write-Host "Start of the week" }
    "Wednesday" { Write-Host "Midweek" }
    "Friday" { Write-Host "End of the week" }
    default { Write-Host "Another day" }
}

# While loop
$i = 0
while ($i -lt 5) {
    Write-Host "Iteration $i"
    $i++
}

# Do-While loop
$i = 0
do {
    Write-Host "Iteration $i"
    $i++
} while ($i -lt 5)

# For loop
for ($i = 0; $i -lt 5; $i++) {
    Write-Host "For loop iteration $i"
}

# Foreach loop (ForEach-Object)
$numbers = 1..5
foreach ($num in $numbers) {
    Write-Host "Foreach loop iteration $num"
}

# Break and Continue
for ($i = 0; $i -lt 5; $i++) {
    if ($i -eq 2) {
        break  # Exits the loop
    }
    if ($i -eq 1) {
        continue  # Skips the current iteration
    }
    Write-Host "Looping: $i"
}

# Try, Catch, Finally
try {
    $result = 10 / 0  # This will cause an error
} catch {
    Write-Host "Error caught: $_"
} finally {
    Write-Host "Finally block executed"
}

# Throw
try {
    throw "Something went wrong"
} catch {
    Write-Host "Caught exception: $_"
}

# Exit
exit 0  # Exits the script with a status code

# Filter (using a simple example to demonstrate)
filter GetEvenNumbers {
    param ($number)
    if ($number % 2 -eq 0) {
        Write-Host "Even number: $number"
    }
}

1..10 | GetEvenNumbers

# Workflow (Using PowerShell workflows)
workflow Test-Workflow {
    param ($input)
    $input | ForEach-Object {
        Write-Host "Processing: $_"
    }
}
Test-Workflow -input "Data"

# Parallel (Runs tasks in parallel in workflows)
workflow Test-Parallel {
    parallel {
        Write-Host "Running in parallel"
    }
}

Test-Parallel

# Sequence (Ensures tasks are run sequentially in workflows)
workflow Test-Sequence {
    sequence {
        Write-Host "First step"
        Write-Host "Second step"
    }
}
Test-Sequence

# Variable scope
$global:globalVar = "Global Variable"
$script:scriptVar = "Script Variable"
$local:localVar = "Local Variable"
$private:privateVar = "Private Variable"

Write-Host "Global: $globalVar"
Write-Host "Script: $scriptVar"
Write-Host "Local: $localVar"
Write-Host "Private: $privateVar"

# Special variables
$variable = "Hello, World!"
Write-Host $variable
Write-Host ${variable}

# Checking last command result
Write-Host "Last command successful: $?"

# Checking previous pipeline results
$previousResult = $^
Write-Host "Previous command result: $previousResult"

# $_ - Current object in the pipeline
1..3 | ForEach-Object {
    Write-Host "Processing: $_"
}

# $null, $true, $false
$nullVar = $null
$trueVar = $true
$falseVar = $false
Write-Host "$nullVar, $trueVar, $falseVar"

# $PSItem - Alias for $_ in the pipeline
1..3 | ForEach-Object {
    Write-Host "PSItem is: $PSItem"
}

# Arguments in the script
Write-Host "Script arguments: $args"

# Collection contains value (-contains, -notcontains)
$collection = 1..5
Write-Host "Collection contains 3: " ($collection -contains 3)
Write-Host "Collection doesn't contain 6: " ($collection -notcontains 6)

# Type comparison (-is, -isnot)
$object = "Hello"
Write-Host "$object is [string]: " ($object -is [string])

# Assignment operators
$val = 10
$val += 5
Write-Host "val after += 5: $val"
$val -= 3
Write-Host "val after -= 3: $val"
$val *= 2
Write-Host "val after *= 2: $val"
$val /= 2
Write-Host "val after /= 2: $val"
$val %= 2
Write-Host "val after %= 2: $val"

# Increment and Decrement
$counter = 5
$counter++
Write-Host "Counter after increment: $counter"
$counter--
Write-Host "Counter after decrement: $counter"

# Logical operators (-and, -or, -xor, -not)
$a = $true
$b = $false
Write-Host "a -and b: " ($a -and $b)
Write-Host "a -or b: " ($a -or $b)
Write-Host "a -xor b: " ($a -xor $b)
Write-Host "not a: " (-not $a)

# Logical NOT alternative (!)
Write-Host "Logical NOT using ! : " (!$a)


```