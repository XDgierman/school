#include <iostream>
#include <math.h>
#include <fstream>
using namespace std;

bool czy_pierwsza(int x){
	if (x>2){
	if (x%2==0) return false;}
	int dz=3;
	while (dz<=sqrt(x)){
		if (x%dz==0){
			return false;
		}
		else dz++;
	}
	return true;
}
int main(){
  ifstream file;
  file.open("liczby.txt");
  int from;
  float x;
  for (int i=0;i<500;i++){
    file>>from;
    //cout<<from<<endl;
    x=sqrt(from);
    if ((int)x==x){
      if (czy_pierwsza((int)x)) cout<<from<<endl;
    }
  };
	return 0;
}
