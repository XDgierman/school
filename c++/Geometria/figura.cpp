#include <iostream>
#include <fstream>
#include <iomanip>
using namespace std;

float dlugosc(float x){
	float f=-(x*x)/50;
	float g=1+(x*x)/100-x/200;
	return g-f;
}

int main(){
	float pt=0;
	for (float i=0.02;i<10.01;i+=0.01){
		pt+=((dlugosc(i-0.01)+dlugosc(i))/2.00)*0.01;
		//cout<<dlugosc(i-0.01)<<" "<<dlugosc(i)<<endl<<pt<<endl<<endl;
		cout<<i<<endl;
	}
	ofstream file;
	file.open("figura.txt");
	file<<pt;
	cout<<setprecision(4)<<pt;
	return 0;
}
