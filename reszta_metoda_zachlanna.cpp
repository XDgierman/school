#include <iostream>
using namespace std;

int main(){
	int n[]={200,100,50,20,10,5,2,1};	
	int m=769, i=0, l;
	while (m!=0){
		l=0;
		while (m>=n[i]){
			l++;
			m-=n[i];
		}
		if (l!=0){
			cout<<l<<" x "<<n[i]<<" zl"<<endl;
		}
		i++;
		}
	}
	
