#include <iostream>
#include <fstream>
using namespace std;

int main(){
	int x,y,c1=0,c2=0,c3=0,c4=0;
	ifstream file;
	file.open("punkty10000.txt");
	for (int i=0; i<10000; i++){
		file>>x;
		file>>y;
		if (x >=0 && y >=0) {
			c1++;
		} else if (x <0 && y >=0) {
			c2++;
		} else if (x <0 && y <0) {
			c3++;
		} else {
			c4++;
		}
	}
	cout<<c1<<" "<<c2<<" "<<c3<<" "<<c4;
	return 0;
}
