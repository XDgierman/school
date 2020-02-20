#include <iostream>
#include <fstream>
#include "caesar.h"

int main()
{
    ifstream file1;
    ofstream output1;
    file1.open("dane_6_1.txt");
    output1.open("wyniki_6_1.txt");
    ifstream file2;
    ofstream output2;
    file2.open("dane_6_2.txt");
    output2.open("wyniki_6_2.txt");
    string x;
    int i,n;
    for (i = 0; i < 1000; i++)
    {
        file1 >> x;
        output1 << caesar(x, 107) << endl;
    }
    for (i = 0; i < 500; i++)
    {
        file2 >> x >> n;
        output2 << decaesar(x, n) << endl;
    }
}