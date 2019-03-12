#include <iostream>
#include <fstream>
using namespace std;

int main(){
	int x1,x2,x3,y1,y2,y3, l=0;
	float a,b;
	ifstream file;
	file.open("punkty1000.txt");
	for (int i=0; i<1000; i++){
		file>>x1;
		file>>y1;
		file>>x2;
		file>>y2;
		file>>x3;
		file>>y3;
		a=(float)(y2-y1)/(x2-x1);
		b=(float)y1-(a*x1);
		if (y3==(a*x3)+b){
			cout<<x3<<" "<<y3<<endl;
			l++;
		}
	}
	cout<<l;
	return 0;
}
