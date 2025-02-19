```perl
#!/usr/bin/perl
use strict;
use warnings;

# Function Declaration
sub add {
    my ($a, $b) = @_;
    return $a + $b;
}

# Package (Similar to Classes in Perl)
package Person;

sub new {
    my ($class, $name, $age) = @_;
    my $self = {
        name => $name,
        age  => $age,
    };
    bless $self, $class;
    return $self;
}

sub print_details {
    my $self = shift;
    print "Name: " . $self->{name} . "\n";
    print "Age: " . $self->{age} . "\n";
}

# Main Code 

# Variables
my $number = 42;
my $greeting = "Hello, Perl!";
print "Number: $number\n";
print "Greeting: $greeting\n";

# Control Flow: if-else
if ($number > 10) {
    print "Number is greater than 10\n";
} else {
    print "Number is 10 or less\n";
}

# Control Flow: given-when (Perl 5.10+)
use feature 'switch';
given ($number) {
    when ($_ > 10) { print "Number is greater than 10\n"; }
    default { print "Number is 10 or less\n"; }
}

# Loops
for my $i (1..5) {
    print "For Loop: $i\n";
}

my $i = 1;
while ($i <= 5) {
    print "While Loop: $i\n";
    $i++;
}

# Function Call
my $result = add(5, 10);
print "Sum: $result\n";

# Object Creation and Method Call
my $person = Person->new("John Doe", 30);
$person->print_details();

# Error Handling
eval {
    die "Sample Exception";
};
if ($@) {
    print "Exception: $@\n";
}

# Arrays
my @array = (1, 2, 3);
print "Array Element: $array[0]\n";

# Hashes (Associative Arrays)
my %hash = ("key1" => "value1", "key2" => "value2");
print "Hash Value: $hash{'key1'}\n";

# Perl Variables in Strings
my $name = "John";
print "Hello, $name!\n";

# Constants
use constant PI => 3.14159;
print "PI: " . PI . "\n";

# Special Variables
print "Script Name: $0\n";
print "Process ID: $$\n";

```