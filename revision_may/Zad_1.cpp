#include <iostream>
#include <ctime>
#include <cstdlib>

using namespace std;

int main(){
	int i, t[1000], b, c, min=1001, max=0, z1, z2;
	srand(time(NULL));
	for(i=0;i<1000;i++){
		t[i]=rand()%1000;
	/*	cout.width(4);
		cout<<t[i];
	*/	c=0;
		do{
		b=t[i]%10;
		c=c+b;
		t[i]=t[i]/10;
	//	cout<<t[i];
	}while(t[i]>0);
	if (c>max) {
	max=c;
	z1=i;
	}
	if (c<min) {
		min=c;
		z2=i;
	}
	}
	cout/*<<endl*/<<min<<" na pozycji "<<z2<<endl<<max<<" na pozycji "<<z1;
}
