#include <iostream>
#include <fstream>
#include <cmath>
using namespace std;

int main(){
	int x1,x2,y1,y2,a,b,co=0;
	float c,min=9999,max=-1;
	ifstream file;
	file.open("odcinki10000.txt");
	for (int i=0; i<10000; i++){
		file>>x1;
		file>>y1;
		file>>x2;
		file>>y2;
		a=y1-y2;
		b=x1-x2;
		c=sqrt((a*a)+(b*b));
		if (c < min && c!=0){
			min=c;
		}
		if (c > max){
			max=c;
		}
		if (c > 30){
			co++;
		}
}
cout<<min<<", "<<max<<", "<<co<<endl;
return 0;
}
