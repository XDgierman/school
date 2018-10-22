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
file.open("liczby5000.txt");
ofstream test;
test.open("test.txt");
int a, l=0;
for (int i=0;i<5000;i++){
file>>a;
if (cyfry(a)>=10 && cyfry(a)<=99){
  cout.width(10);
  cout<<a;
  l++;
} else test<<a<<endl;
};
cout<<endl<<l<<endl;
}
