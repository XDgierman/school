#include <iostream>

using namespace std;
int sum(int a, int b){
	a=a+b;
	return a;
}

int main(){
	int x,y,tmp;
	cin>>x;
	do {
	cin>>y;
	tmp=x;
	x=sum(x,y);
	cout<<tmp<<" + "<<y<<" = "<<x<<endl;
	}while (x<100);
	return 0;
}
