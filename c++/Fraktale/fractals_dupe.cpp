#include <iostream>
#include <fstream>
#include <cstdlib>
using namespace std;

int main(){
  ofstream file;
  file.open("output.txt");
  float x,y;
  int i,los;
  x=1;
  y=1;
  for (i=0;i<50101;i++){
    los=rand()%1000000;
    if (los<=787472){
      x=(0.824074)*x + (0.281428)*y - 1.882290;
      y=(-0.212346)*x + (0.864198)*y - 0.110607;
    }
    else {
      x=(0.088272)*x + (0.520988)*y + 0.785360;
      y=(-0.463889)*x - (0.377778)*y + 8.095795;
    }
    if (i>100){
      file<<x<<" "<<y<<endl;
    }
  }
  file.close();
  return 0;
}
