```objc
#import <Foundation/Foundation.h>

// ==========================
// 1. Class & OOP Features
// ==========================

// Base Class (Encapsulation)
@interface Animal : NSObject {
@protected
    NSString *name;
}
- (void) setName:(NSString *)newName;
- (NSString *) getName;
- (void) speak;
@end

@implementation Animal
- (void) setName:(NSString *)newName {
    name = newName;
}
- (NSString *) getName {
    return name;
}
- (void) speak {
    NSLog(@"Animal sound...");
}
@end

// Derived Class (Inheritance & Polymorphism)
@interface Dog : Animal
@end

@implementation Dog
- (void) speak {
    NSLog(@"%@ says: Woof! 🐶", name);
}
@end

// ==========================
// 2. Functions & Operators
// ==========================
int add(int a, int b) {
    return a + b;
}

// Block Function (Anonymous Function)
typedef int (^MultiplyBlock)(int, int);

// ==========================
// 3. Error Handling
// ==========================
void errorExample() {
    @try {
        NSArray *arr = @[@1, @2, @3];
        NSLog(@"Accessing index 5: %@", arr[5]); // Out of bounds error
    }
    @catch (NSException *exception) {
        NSLog(@"Caught Exception: %@", exception.reason);
    }
    @finally {
        NSLog(@"Error handling complete!");
    }
}

// ==========================
// 4. File I/O
// ==========================
void fileIOExample() {
    NSString *path = @"test.txt";
    NSString *content = @"Hello, Objective-C File I/O!";
    [content writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];

    NSString *readContent = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"File Content: %@", readContent);
}

// ==========================
// 5. Multithreading
// ==========================
void runInBackground() {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"Running in background thread...");
    });
}

// ==========================
// 6. Main Function
// ==========================
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Objective-C Features Test");

        // Variables & Operators
        int a = 10, b = 5;
        NSLog(@"Addition: %d + %d = %d", a, b, add(a, b));
        
        // Bitwise Operators
        NSLog(@"Bitwise AND: %d & %d = %d", a, b, a & b);
        
        // Anonymous Function (Block)
        MultiplyBlock multiply = ^(int x, int y) {
            return x * y;
        };
        NSLog(@"Multiplication using Block: %d * %d = %d", a, b, multiply(a, b));

        // Loops & Conditionals
        for (int i = 1; i <= 5; i++) {
            NSLog(@"For loop iteration: %d", i);
        }

        // Switch-case
        switch (a) {
            case 10: NSLog(@"a is 10"); break;
            default: NSLog(@"a is something else");
        }

        // Object-Oriented Programming
        Dog *myDog = [[Dog alloc] init];
        [myDog setName:@"Buddy"];
        [myDog speak];

        // Error Handling
        errorExample();

        // File I/O
        fileIOExample();

        // Multithreading
        runInBackground();
        
        // Sleep to allow background thread to execute
        [NSThread sleepForTimeInterval:1.0];
    }
    return 0;
}

```