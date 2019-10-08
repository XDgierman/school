#include <iostream>
#include <fstream>
using namespace std;

int main(){
    ifstream file;
    file.open("liczby.txt");
    int x,y,summary=0,tmp;
    for(int i=0;i<1000;i++){
        file>>x;
        y=x;
        tmp=0;
        while(x>0){
            tmp+=x%10;
            x/=10;
        }
        if(tmp>30){
            cout<<y<<" = "<<tmp<<endl;
        }
        summary+=tmp;
    }
    cout<<"Suma wszystkich cyfr = "<<summary<<endl;
    return 0;
}
