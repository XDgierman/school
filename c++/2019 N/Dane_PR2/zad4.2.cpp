#include <iostream>
#include <fstream>
#include <string>
using namespace std;

int silnia(int x)
{
    if(x > 1)
        return x * silnia(x - 1);
    else
        return 1;
}

int main(){
    ifstream file;
    file.open("liczby.txt");
    int x;
    string tx;
    for(int i=0;i<500;i++){
        file>>x;
        tx = to_string(x);
        int wsilni = 0;
        for (int j=1;j<=tx.length();j++){
            wsilni += silnia((int)tx[j]);
        }
        if (x == wsilni){
            cout<<x<<endl;
        }
    }
    return 0;
}
