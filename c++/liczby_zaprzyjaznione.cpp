#include <iostream>
using namespace std;

int liczba(int x){
  int j=1,w=0;
  while (j<=x/2){
    if (x%j==0){
      w+=j;
      j++;
    }
    else j++;
  }
  return w;
}

int main(){
  int j,k,a;
for (int i=2; i<10000; i++){
  a=i;
  j=liczba(a);
  k=liczba(j);
  if (a<j){
if (k==a & a!=j){
  cout<<a<<", "<<j<<endl;
  }
}
  }
}
