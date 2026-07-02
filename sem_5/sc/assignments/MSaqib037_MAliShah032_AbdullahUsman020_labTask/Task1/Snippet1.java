public class Snippet1 { 
    public static void main(String[] args) { 
        int number = 10.5; // Error: mismatch typecast - quick fix: number = (int) 10.5;
        System.out.println(number); 
    } 
}

// Error: incompatible types: possible lossy conversion from double to int
// Explanation: double is directly assigned to int but it requires typecast
// Quick fix: typecast double to int