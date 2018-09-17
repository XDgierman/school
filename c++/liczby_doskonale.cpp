#include <iostream>
using namespace std;

int main(){
for (int i=1; i<10000; i++){
  int j=1,w=0;
  while (j<=i/2){
    if (i%j==0){
      w+=j;
      j++;
    }
    else j++;
  }
  if (w==i){
    cout<<i<<endl;
  }
}
}
