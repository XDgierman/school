#include <iostream>
#include <fstream>
using namespace std;
int max(int a,int b, int c){
	int max = a;
	if (b > max) max = b;
	if (c > max) max = c;
	return max;
}
int min
int main(){
	int x,y,z,t=0;
	ifstream file;
	file.open("boki1000.txt");
	for (int i=0; i<1000; i++){
	file>>x;
	file>>y;
	file>>z;
	if (x+y>z) {
			if (x+z>y) {
				if (y+z>x) {
					t++;
				}
			}
		}
	}
	cout<<t;
	return 0;
}
