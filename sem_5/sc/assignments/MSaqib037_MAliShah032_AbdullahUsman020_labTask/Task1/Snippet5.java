public class Snippet5 { 
    public static void main(String[] args) { 
        int[] numbers = {1, 2, 3}; 
        System.out.println(numbers["1"]); // Error 
    } 
}

// Error: incompatible types - String cannot be converted to int
// Explanation: to access element in array, it requires int index
// quick fix: change index "1" to 1