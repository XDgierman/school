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
  int j,k;
for (int i=2; i<10000; i++){
  j=liczba(i);
  k=liczba(j);
if (i==j){
  cout<<j<<", "<<k<<endl;
}
  }
}
