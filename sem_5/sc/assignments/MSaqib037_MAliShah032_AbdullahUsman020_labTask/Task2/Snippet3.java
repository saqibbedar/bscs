public class Snippet3 {
    
    public static String getNumber() {
        return "42"; // Error fixed, update return type 42 -> "42", we can also use String.valueOf(42) to convert int to String
    } 

    public static void main(String[] args) { 
        System.out.println(getNumber()); 
    } 
} 
