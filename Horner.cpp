#include <iostream>

using namespace std;
int Horner(int a[],int x, int n){
	int b=a[0];
	for (int i=1;i<=n;i++){
		b=b*x+a[i];
	}
	return b;
}

int main(){
	
int n;
cout<<"podaj stopien wielomianu: ";
cin>>n;
int a[n+1];
for (int i=0;i<=n;i++){
	cout<<"podaj wspolczynnik nr. "<<i<<": ";
	cin>>a[i];
}
cout<<"dla jakiej wartosci? ";
int x;
cin>>x;
cout<<Horner(a,x,n);
}




