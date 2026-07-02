public class Snippet4 { 
    public static void main(String[] args) { 
        int a = 5; 
        boolean b = true; 
        int result = a + b; // Error 
        System.out.println(result); 
    } 
}

// Error: bad operand types for binary operator +
// Explanation: performing addition between int and boolean is irrational
// quick fix: change variable b type to int and initialize b with some integer value