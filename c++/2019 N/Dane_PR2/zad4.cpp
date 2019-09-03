#include <iostream>
#include <fstream>
using namespace std;

int pot(int a, int b){
	int tmp=a;
	for (int i=0; i<b-1; i++){
		tmp=tmp*a;
	}
	return tmp;
}

bool power(int x){
    bool test=false, ispower=false;
    int tpower = 0;
    while (test==false){
        if (tpower > 10){
            test=true;
        }
        else if (x == pot(3,tpower)){
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
