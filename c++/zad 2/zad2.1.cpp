#include <iostream>
#include <fstream>
using namespace std;


int main(){
    ifstream file;
    file.open("liczby.txt");
    int x,out=0;
    for(int i=0;i<1000;i++){
        file>>x;
        if(x%2==0){
            if (x>out){
                out=x;
            }
        }
    }
    cout<<out<<endl;
    return 0;
}
