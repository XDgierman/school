#include <iostream>
#include <fstream>
using namespace std;

bool palindrom (string a){
	string w="";
	for (int i=a.length()-1;i>=0;i--){
	w+=a[i];
	}
	if (a==w){
		return true;
	} else return false;
}

int main(){
    ifstream file;
    file.open("liczby.txt");
    string x;
    for(int i=0;i<1000;i++){
        file>>x;
        if(palindrom(x)){
            cout<<x<<endl;
        }
    }
    return 0;
}
