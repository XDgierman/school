#include <iostream>
#include <fstream>
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
    int x,tmp,wsilni,tmpx;
    for(int i=0;i<500;i++){
        file>>x;
        tmp = x;
        wsilni = 0;
        while (tmp>0){
            tmpx = tmp%10;
            wsilni += silnia(tmpx);
            tmp/=10;
        }
        if (x == wsilni){
            cout<<x<<endl;
        }
    }
    return 0;
}
