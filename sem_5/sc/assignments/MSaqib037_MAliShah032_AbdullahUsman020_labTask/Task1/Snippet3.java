public class Snippet3 {
    
    public static String getNumber() { 
        return 42; // Error 
        /*
         * Quick fix: 
         * 1. change return type to int
         * 2. return "" + 42;
         * 3. return Integer.toString(42);
         * 4. return String.valueOf(42);
         */
    } 
 
    public static void main(String[] args) { 
        System.out.println(getNumber()); 
    } 
} 

// Error: incompatible type - int cannot be converted to string
// Explanation: function return type requires String not int
// quick fix: return String value i.e., "Hello, world" instead of 42