/*
4. (Desk check) Determine the output of the following program:
#include <iostream>
using namespace std;
int main()
{
int i; 
for (i = 20; i >= 0; i -= 4)
cout << i;
return 0;
}
*/

#include <iostream>
using namespace std;
int main() 
{
    int i;
    for (i = 20; i >= 0; i -= 4)
    cout << i; 
    
    // output is: 201612840

    return 0; 
}