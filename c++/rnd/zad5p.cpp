#include <iostream>
#include <fstream>

using namespace std;


int main(){
int t[13];
for (int i=1;i<13;i++){
  t[i]=0;
}
ifstream file;
file.open("slowa.txt");
string a;
for (int i=0;i<1000;i++){
file>>a;
t[a.length()]++;
}
for (int i=1;i<13;i++){
  cout<<t[i]<<endl;
}
}
