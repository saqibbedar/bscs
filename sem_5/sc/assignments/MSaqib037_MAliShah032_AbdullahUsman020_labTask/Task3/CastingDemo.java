class Animal { 
void sound() { System.out.println("Animal sound"); } 
} 
class Dog extends Animal { 
void sound() { System.out.println("Bark"); } 
} 
public class CastingDemo { 
public static void main(String[] args) { 


//------------------------------------- Primitive casting--------------------------------------   
int x = 100; 
//The datatype of variable is the same as the input value or some other value assigned to it.
//In this declaration , 100 is an integer and the datatype of variable is also integer.//
//This is called primitive casting//



// -------------------------------------Widening ------------------------------------------------
double y = x;

//When a value that is of smaller size than a datatype of variable which it is saved into is widening
//For example if we store an integer value into a float type variable.
//During compilation it won't cause errors
 


// --------------------------------------Narrowing cast --------------------------------------------

double z = 9.78; 
int w = (int) z; 

//This snippet was originally : double z = 9.78; int w = z; 
//Problem in this is that , a large value assigned to a smaller datatype , i.e, float into integer
//would cause loss in the larger value , which can cause problems in calculations and program won't run
//as expected.

//So in this code we have 2 options either to initialize w as double or we can initialize z as int.
//Choosing between the two options depends on our problem requirement. 



// ------------------------------- UnSafe Casting ------------------------------------------//


// Object casting 
Animal a = new Animal(); 
try{
Dog d = (Dog) a; // Unsafe cast - will cause runtime error 
d.sound(); 
}catch(ClassCastException e){
	System.out.println("Error Occured" + e);
}



/*The above snippet shows unsafe casting due to the following reasons
 the instance of the Animal class is created and in the next line it is
 casting it as Dog which is actually the child of the Animal class 
 the object a of Animal type is a reference pointing to the parent object not 
 a child object that's why it will cause runtime error. */




// ------------------------------Safe Casting ---------------------------------------------------//
Animal a_2 = new Dog();
Dog d_2 = (Dog) a_2;
d_2.sound();


/* The above snippet is an example of safe casting due to the following reasons
The instance of Dog is created (which is derived of Animal class) and being assiged to the
Animal type object and in the next line it is casting it to Dog (since it was instance of Dog)
*/

} 
}