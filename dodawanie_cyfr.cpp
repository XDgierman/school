// 1. jako string
#include <iostream>
#include <fstream>
using namespace std;



int parzyste(){
ifstream p;
p.open("cyfry.txt");
int x,i=0;
for(int o=0;o<1000;o++){
p>>x;
if (x%2==0) i++;
}
return i;
}


int min(){
	ifstream p;
	p.open("cyfry.txt");
	int min=100, x, r, tmp;
	for(int i=0;i<1000;i++){
		int sum=0;
		p>>x;
		tmp=x;
		do{
			sum=sum+x%10;
			x=x/10;
		}while (x!=0);
		if (sum<min) {
		min=sum;
		r=tmp;
	}
}
	return r;
}

int max(){
	ifstream p;
	p.open("cyfry.txt");
	int max=-1, x, r, tmp;
	for(int i=0;i<1000;i++){
		int sum=0;
		p>>x;
		tmp=x;
		do{
			sum=sum+x%10;
			x=x/10;
		}while (x!=0);
		if (sum>max) {
		max=sum;
		r=tmp;
	}
}
	return r;
}


int main(){	
	cout<<parzyste()<<endl;
	cout<<min()<<endl;
	cout<<max();
}
