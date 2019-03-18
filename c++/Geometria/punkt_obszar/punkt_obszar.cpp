#include <iostream>
#include <fstream>
using namespace std;

int main(){
	int x1,x2,x3,y1,y2,y3,c1=0,c2=0,c3=0,c4=0;
	float a,b;
	ifstream file;
	file.open("p1000.txt");
	for (int i=0; i<1000; i++){
		file>>x1;
		file>>y1;
		file>>x2;
		file>>y2;
		file>>x3;
		file>>y3;
		a=(float)(y2-y1)/(x2-x1);
		b=(float)y1-(a*x1);
		if (x3 >=0 && y3 >=0) {
				if (a < 0 && b > 0){
					c1++;
				}
		} else if (x3 <0 && y3 >=0) {
				if (a > 0 && b < 0){
					c2++;
				}
		} else if (x3 <0 && y3 <0) {
				if (a < 0 && b < 0){
					c3++;
				}
		} else {
				if (a > 0 && b > 0){
					c4++;
				}
		}
	}
	cout<<c1<<", "<<c2<<", "<<c3<<", "<<c4<<endl;
	return 0;
}
