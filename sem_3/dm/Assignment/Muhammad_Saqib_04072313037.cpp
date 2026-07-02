/*
Name: Muhammad Saqib
Roll No: 04072313037
Assignment No: 01
Title: Computer Program to generate the truth table of expression, expression must contain three variables i.e (P AND Q)->R
*/

#include <iostream>
#include <string>
using namespace std;

// Helper functions
bool CheckAND(bool a, bool b) { return a && b; }
bool CheckNOT(bool a) { return !a; }
bool CheckOR(bool a, bool b) { return a || b; }
bool CheckBIDIRECTIONAL(bool a, bool b) { return a == b; }
bool CheckIMPLIES(bool a, bool b) { return !a || b; }
bool CheckXNOR(bool a, bool b) { return !(a ^ b); }

// Expression evaluation helper function
bool EvaluateExpression(bool p, bool q, bool r, const string& connector1, const string& connector2) {

    bool holdFirstExpResult; // Hold the result of the first expression

    // Evaluate the first expression
    if (connector1 == "&") {
        holdFirstExpResult = CheckAND(p, q);
    } else if (connector1 == "|") {
        holdFirstExpResult = CheckOR(p, q);
    } else if (connector1 == "!") {
        holdFirstExpResult = CheckNOT(p);
        // Since there's no second variable for NOT, you might want to skip the second connector in this case
        return holdFirstExpResult; // Return immediately if NOT is the first operator
    } else if (connector1 == "->") {
        holdFirstExpResult = CheckIMPLIES(p, q);
    } else if (connector1 == "<->") {
        holdFirstExpResult = CheckBIDIRECTIONAL(p, q);
    } else if (connector1 == "<==>") {
        holdFirstExpResult = CheckXNOR(p, q);
    } else {
        return false; // Invalid connector
    }

    // Evaluate the second expression
    if (connector2 == "&") {
        return CheckAND(holdFirstExpResult, r);
    } else if (connector2 == "|") {
        return CheckOR(holdFirstExpResult, r);
    } else if (connector2 == "!") {
        return CheckNOT(holdFirstExpResult);
    } else if (connector2 == "->") {
        return CheckIMPLIES(holdFirstExpResult, r);
    } else if (connector2 == "<->") {
        return CheckBIDIRECTIONAL(holdFirstExpResult, r);
    } else if (connector2 == "<==>") {
        return CheckXNOR(holdFirstExpResult, r);
    }

    return false; // Invalid connector
}

// Truth Table generator function
void tableGenerator(char v1, const string& connector1, char v2, const string& connector2, char v3){
    system("cls");
    cout << "\nTruth Table for expression (" << v1+connector1+v2<<")"<<connector2+v3<<" is :\n\n";
    
    cout << (char)toupper(v1) << "      " << (char)toupper(v2) << "     " << (char)toupper(v3) << "     " << "Result\n";
    cout << "__________________________\n\n";
    // 2^3 = 8 combinations
    for (int i = 0; i < 8; i++){

        bool p = (i & 4) > 0;
        bool q = (i & 2) > 0;
        bool r = (i & 1) > 0;

        bool result = EvaluateExpression(p, q, r, connector1, connector2);

        // print table
        cout << (p ? "T" : "F")  << "      " << (q ? "T" : "F")  << "     " << (r ? "T" : "F") << "       " << (result ? "T" : "F") << endl;
    }
}

// Validate Connector Input
void handleConnectorInput(string& connector, const string& connectors){
    bool isValidConnector = false;
    cout << "Please enter a valid connector: [& (AND), | (OR), ! (NOT), -> (IMPLIES), <-> (IFF), <=> (XNOR)]" << endl;
    while (!isValidConnector)
    {
        cout << "Enter connector: ";
        cin >> connector;
        // find connector in connectors string
        if(connectors.find(connector) != string::npos){
            isValidConnector = true; 
        } else {
            cout << "Invalid connector. Please enter one of [& (AND), | (OR), ! (NOT), -> (IMPLIES), <-> (IFF), <=> (XNOR)]\n";
        }
    }
}

int main()
{
    string connectors = "&|!-><-><=>"; // Supported connectors
    char var1; // variable 1
    char var2; // variable 2
    char var3; // variable 3
    string connector1; // connector 1
    string connector2; // connector 2

    // input variable 1
    cout << "Enter a variable 1 (e.g., p, q, r): ";
    cin >> var1;

    // input connector 1
    handleConnectorInput(connector1, connectors);

    // input variable 2
    cout << "Enter a variable 2 (e.g., p, q, r): ";
    cin >> var2;

    // input connector 2
    handleConnectorInput(connector2, connectors);

    // input variable 3
    cout << "Enter a variable 3 (e.g., p, q, r): ";
    cin >> var3;

    cout << "\nYou entered expression: (" << var1+connector1+var2<<")"<<connector2+var3<<"\n";

    // generate table
    tableGenerator(var1, connector1, var2, connector2, var3);

    return 0;
}
