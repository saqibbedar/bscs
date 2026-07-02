/*
11. (Debug) Is the following program correct? If it is, determine its output. If it’s not, determine the error and correct it so that the program will run.

#includeƒ<iostream>
using namespace std;
int main()
{
for(int i = 1; i < 10; i++)
cout << i << ‘\n’;
for (j = 1; i < 5; i++)
cout << i << endl;
return 0;
}

                            *Answer*

The program contain syntax error, the first one is single quotes are not used properly as their formation is effecting to print out the output to the console. Secondly, j is not initialized as a variable, thirdly, i is being acceded inside the second loop while it has has only scope to its first loops body because declaration of i is inside the 1st loop so it is throwing an error to run the program properly because variables are being accessed beyond their scope and without declaration.

To fix the errors, let's surround the \n with proper quotes, then declare j variable and initialize i variable outside the loops body to access it inside the second loop.
*/

#include <iostream>
using namespace std;
int main()
{
    // updated code
    
    int i;
    for(i = 1; i < 10; i++)
    cout << i << '\n';
    for (int j = 1; i < 5; i++)
    cout << i << endl;
    return 0;
}