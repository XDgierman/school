#include <iostream>
#include <fstream>
using namespace std;

int main(){
  int x, y, w=0;
  ifstream file;
  file.open("PARY_LICZB.txt");
  for (int i=0; i<1000; i++){
    file>>x;
    file>>y;
    if (x%y==0) w++;
    else if (y%x==0) w++;
  };
  cout<<w<<endl;
  return 0;
}
