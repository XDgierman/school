#include <iostream>
using namespace std;

float pierwiastek(float a){
  float x=a/2;
  for (int i=0;i<10;i++){
    x=(x+(a/x))/2;
  }
  return x;
}

int main(){

for (int i=1;i<101;i++){
  float f=i;
	cout<<i<<"    "<<pierwiastek(f)<<endl;
}
}
