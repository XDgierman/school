#include <iostream>
#include <fstream>
#include <cstdlib>
using namespace std;

int main(){
  ofstream file;
  file.open("output.txt");
  float x,y;
  int i,los,p=142;
  x=1;
  y=1;
  for (i=0;i<5000;i++){
    los=rand()%994;
    if (los>=0 && los<=p){
      x=(0.05)*x + (0.0)*y - 0.06;
      y=(0.0)*x + (0.4)*y - 0.47;
    }
    else if (los>=p+1 && los<=p*2){
      x=(-0.05)*x + (0.0)*y - 0.06;
      y=(0.0)*x - (0.4)*y - 0.47;
    }
    else if (los>=(p*2)+1 && los<=p*3){
      x=(0.03)*x - (0.14)*y - 0.16;
      y=(0.0)*x + (0.26)*y - 0.01;
    }
    else if (los>=(p*3)+1 && los<=p*4){
      x=(-0.03)*x + (0.14)*y - 0.16;
      y=(0.0)*x - (0.26)*y - 0.01;
    }
    else if (los>=(p*4)+1 && los<=p*5){
      x=(0.56)*x + (0.44)*y + 0.3;
      y=(-0.37)*x + (0.51)*y + 0.15;
    }
    else if (los>=(p*5)+1 && los<=p*6){
      x=(0.19)*x + (0.07)*y - 0.2;
      y=(-0.1)*x + (0.15)*y + 0.28;
    }
    else {
      x=(-0.33)*x - (0.34)*y - 0.54;
      y=(-0.33)*x + (0.34)*y + 0.39;
    }
    if (i>100){
      file<<x<<" "<<y<<endl;
    }
  }
  file.close();
  return 0;
}
