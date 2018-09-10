#include <iostream>
#include <cstdlib>
using namespace std;

int main(){
	int t[10];
	int* wsk=new int[10];
	wsk=t;
	for (int i=0;i<10;i++){
		t[i]=rand();
		cout<<t[i]<<" "<<wsk+i<<" "<<*(wsk+i)<<endl;
	}
}
