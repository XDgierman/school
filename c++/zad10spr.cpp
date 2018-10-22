#include <iostream>
#include <fstream>
using namespace std;

int cyfry(int x){
  int z=0;
  while(x!=0){
    z+=x%10;
    x/=10;
  };
  return z;
}

int main(){
ifstream file;
int a,b;
file.open("PARY_LICZB.txt");
for (int i=0;i<1000;i++){
  file>>a;
  file>>b;
  if (cyfry(a)>cyfry(b)){
    cout<<a<<"  "<<b<<endl;
  }
}
}
