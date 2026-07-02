/*
    b. Modify the program you wrote for Exercise 10a to determine on which day the king will have paid the beggar a total of one million dollars.
*/

#include <iostream>
#include <iomanip>
using namespace std;

int main()
{
    cout<<"\nDay Amount Owed\n";
    cout<<"---------------" <<endl;
    
    double cent = 0.01; 

    for (int i = 1; i  <= 64; i++)
    {
        if (cent > 1000000)
        {
            cout<<i <<" is the day when king will pay 1 million to beggar" <<endl;
            break;
        }
        
        cout<<i << setw(15)<< cent << endl;
        cent += cent;
    }
    return 0;
}