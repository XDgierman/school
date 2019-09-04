#include <iostream>
#include <fstream>
#include <cmath>
using namespace std;

bool power(int x){
    bool test=false, ispower=false;
    int tpower = 0;
    while (test==false){
        if (tpower >= 11){
            test=true;
        }
        else if (x == (int)pow((float)3,(float)tpower)){
            test=true;
            ispower=true;
        }
        else tpower++;
    }
    if (ispower){
        return true;
    } else return false;
}

int main(){
    ifstream file;
    file.open("liczby.txt");
    int liczba = 0, x;
    for(int i=0;i<500;i++){
        file>>x;
        if(power(x)){
            liczba++;
        }
    }
    cout<<liczba<<endl;
    return 0;
}
