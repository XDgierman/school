#include <iostream>
#include <fstream>
#include "menu.h"

using namespace std;

int main(){
  ifstream file;
  ofstream output1;
  ofstream output2;
  ofstream output3;
  file.open("hasla.txt");
  output1.open("wynik4a.txt");
  output2.open("wynik4b.txt");
  output3.open("wynik4c.txt");
  int p,n;
  string x,w;
  p=n=0;
  for (int i=0;i<200;i++){
    file>>x;
    if (x.length()%2==0){
      p++;
    } else n++;
    if (palindrom(x)){
      output2<<x<<endl;
    }
    for (int i=1;i<x.length();i++){
      w=substring(x,i-1,i);
      int a=(int)w[0]+(int)w[1];
      if(a==220){
        output3<<x<<endl;
        break;
      }
    }
  }
  output1<<"Parzyste - "<<p<<endl<<"Nieparzyste - "<<n;
  return 0;
}
