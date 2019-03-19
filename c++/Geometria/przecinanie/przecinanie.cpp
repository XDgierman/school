#include <iostream>
#include <fstream>
using namespace std;

int main(){
	int x1,x2,x3,x4,y1,y2,y3,y4,c=0;
	float a1,a2,b1,b2,x,y;
	ifstream file;
	file.open("wsp1000.txt");
	for (int i=0; i<500; i++){
		file>>x1;
		file>>y1;
		file>>x2;
		file>>y2;
		file>>x3;
		file>>y3;
		file>>y4;
		file>>y4;
		a1=(float)(y2-y1)/(x2-x1);
		b1=(float)y1-(a1*x1);
		a2=(float)(y4-y3)/(x4-x3);
		b2=(float)y3-(a2*x3);
		if (a1!=a2){
			x=(b2-b1)/(a1-a2);
			y=(a1*x)+b1;
			cout<<x<<" x "<<y<<endl;
			c++;
		}
	}
	cout<<"Jest "<<c<<" przeciec."<<endl;
	return 0;
}
