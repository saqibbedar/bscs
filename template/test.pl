#!/usr/bin/perl
use strict;
use warnings;

# Control Flow Keywords

# if, else, elsif
my $num = 10;
if ($num > 5) {
    print "Number is greater than 5\n";
} elsif ($num == 5) {
    print "Number is equal to 5\n";
} else {
    print "Number is less than 5\n";
}

# unless (inverse of if)
unless ($num == 10) {
    print "Number is not 10\n";
} else {
    print "Number is 10\n";
}

# while loop
my $counter = 0;
while ($counter < 5) {
    print "Counter is $counter\n";
    $counter++;
}

# until loop (opposite of while)
my $x = 0;
until ($x > 3) {
    print "x is $x\n";
    $x++;
}

# for loop
for my $i (1..3) {
    print "i is $i\n";
}

# foreach loop (usually used to iterate over arrays)
my @array = (1, 2, 3, 4);
foreach my $item (@array) {
    print "Item is $item\n";
}

# next (skips iteration in loops)
foreach my $i (1..5) {
    next if $i == 3; # Skips the iteration when $i is 3
    print "Value is $i\n";
}

# last (exits the loop)
foreach my $i (1..5) {
    last if $i == 4; # Stops the loop when $i is 4
    print "Value is $i\n";
}

# redo (restarts the loop iteration)
my $j = 0;
while ($j < 3) {
    print "Redo iteration $j\n";
    $j++;
    redo if $j == 2; # Restarts the iteration when $j is 2
}

# goto (used to jump to a specific label)
goto SKIP;
print "This won't print\n";
SKIP:
print "This will print after goto\n";

# ________________________________________

#!/usr/bin/perl
use strict;
use warnings;

# Package and Module Keywords

# package (defining a package/module)
package MyPackage;

# sub (defining a subroutine)
sub say_hello {
    print "Hello from MyPackage!\n";
}

# call the subroutine
say_hello();

# use (imports external modules)
use DateTime;
my $dt = DateTime->now;
print "Current date and time: ", $dt->datetime, "\n";

# require (used for dynamic module loading)
require File::Basename;

# my (local variables)
my $local_var = "This is local";
print "$local_var\n";

# our (global variables, available across the package)
our $global_var = "This is global";

# local (temporarily backs up and changes the value of variables)
{
    local $global_var = "This is temporarily local";
    print "$global_var\n";
}

# return (returns a value from a subroutine)
sub add {
    my ($a, $b) = @_;
    return $a + $b;
}
my $sum = add(5, 3);
print "Sum is: $sum\n";

# bless (associates an object with a class)
package MyClass;

sub new {
    my ($class) = @_;
    my $self = {};
    bless $self, $class;
    return $self;
}

my $object = MyClass->new();

# _______________________________________
#!/usr/bin/perl
use strict;
use warnings;

# Exception Handling in Perl

# eval (used to catch exceptions)
eval {
    my $num = 10 / 0; # Division by zero
};
if ($@) {
    print "Error caught: $@\n";
}

# die (used to throw an exception)
eval {
    die "Something went wrong!\n";
};
if ($@) {
    print "Caught die exception: $@\n";
}

# warn (warns but doesn't stop execution)
warn "This is a warning\n";

# try, catch (from the Try::Tiny module)
use Try::Tiny;

try {
    die "This is an error in try block\n";
} catch {
    print "Caught error: $_\n";
};


# ________________________________________

#!/usr/bin/perl
use strict;
use warnings;

# Special Variables in Perl

$_ = "Hello, World!"; # Default variable
print "$_\n"; # prints Hello, World!

# @_ (array of arguments passed to a subroutine)
sub print_args {
    my @args = @_;
    print "Arguments: @args\n";
}
print_args("one", "two", "three");

# $$ (process ID of the Perl script)
print "Current process ID: $$\n";

# $0 (name of the script being executed)
print "Script name: $0\n";

# $@ (error message after eval)
eval {
    die "An error occurred!";
};
print "Error message: $@\n";

# $! (error message for system calls)
open my $fh, '<', 'nonexistent_file.txt' or print "Error: $!\n";

# %ENV (environment variables)
print "PATH: $ENV{PATH}\n";

# @ARGV (command-line arguments)
print "Script name: $0\n";
print "First argument: $ARGV[0]\n";

# $| (auto-flush output buffer)
$| = 1; # turn on auto-flushing for output
print "This prints immediately\n";

# $. (current line number in the file)
open my $fh, '<', 'test.txt' or die "Can't open file: $!\n";
while (<$fh>) {
    print "Line $.: $_";
}

# String and Numeric Comparison
if ("hello" eq "hello") { print "Strings are equal\n"; }
if (10 == 10) { print "Numbers are equal\n"; }
if ("apple" lt "banana") { print "String comparison works\n"; }

# Spaceship operator (<=>)
my $result = 10 <=> 20; # Returns -1 if left side is less than right
print "Spaceship result: $result\n";

# ______________________________

#!/usr/bin/perl
use strict;
use warnings;

# Arithmetic Operators
my $a = 10;
my $b = 5;

my $add = $a + $b;
my $subtract = $a - $b;
my $multiply = $a * $b;
my $divide = $a / $b;
my $mod = $a % $b;
my $exp = $a ** $b;
$add++;  # Increment
$subtract--;  # Decrement

# Assignment Operators
$a = 10;
$a += 5;  # Addition assignment
$a -= 3;  # Subtraction assignment
$a *= 2;  # Multiplication assignment
$a /= 2;  # Division assignment
$a %= 3;  # Modulus assignment
$a .= " world";  # String concatenation assignment

# Numeric Comparison
print "Equal: ", 10 == 10 ? "True" : "False", "\n";
print "Greater than: ", 10 > 5 ? "True" : "False", "\n";
print "Less than: ", 5 < 10 ? "True" : "False", "\n";

# String Comparison
print "Strings equal: ", "hello" eq "hello" ? "True" : "False", "\n";
print "Strings not equal: ", "apple" ne "banana" ? "True" : "False", "\n";
