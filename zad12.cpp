#include <iostream>

using namespace std;

int pot(int a, int b){
	int tmp=a;
	for (int i=0; i<b-1; i++){
		tmp=tmp*a;
	}
	return tmp;
}

int main(){
	int x,y,z;
	cin>>x;
	cin>>y;
	z=pot(x,y);
	cout<<x;
	cout.width(4);
	cout<<y;
	cout.width(7);
	cout<<z;
	
}
