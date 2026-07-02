public class Snippet2 { 
    static int x;
    public static void main(String[] args) { 
        int value; 
        System.out.println(value); // Error 
        System.out.println(x); // Error 
    } 
}

// Error: uninitialized variable
// Explanation: int value is not initialized with any value
// quick fix: assign int value a value i.e., 0 etc