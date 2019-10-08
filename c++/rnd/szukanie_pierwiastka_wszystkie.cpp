#include <iostream>
using namespace std;

float Horner(int a[],float x, int n){
	float b=a[0];
	for (int i=1;i<=n;i++){
		b=b*x+a[i];
	}
	return b;
}

float szukanie(float l, float p, int a[], int n){
	float s;
	while(l<p){
		s=(l+p)/2.0;
		if (Horner(a,s,n)<0.01 && Horner(a,s,n)>-0.01){
			return s;
		}
		if (Horner(a,l,n)*Horner(a,s,n)<0){
			p=s;
		} else {
			l=s;
		}
	};
		return -1000.0;
}

int main(){
	int n;
	cout<<"podaj stopien wielomianu: ";
	cin>>n;
	int a[n+1];
	for (int i=0;i<=n;i++){
		cout<<"podaj wspolczynnik nr. "<<i+1<<": ";
		cin>>a[i];
	}
	cout<<"podaj poczatek: ";
	float l;
	cin>>l;
	cout<<"podaj koniec: ";
	float p;
	cin>>p;
	float x1=-1000.0,x2=-1000.0,x3=-1000.0;
	if (szukanie(l,p,a,n)==-1000.0){
		cout<<"Brak rozwiazan";
	} else x1=szukanie(l,p,a,n);
	if (szukanie(l,x1,a,n)==-1000.0){
		if (szukanie(x1,p,a,n)==-1000.0){
			cout<<x1;
		}
	} else x2=szukanie(l,x1,a,n);
	if (szukanie(x1,p,a,n)==-1000.0){
		cout<<x1<<endl<<x2;
	} else x3=szukanie(x1,p,a,n);
	cout<<x1<<endl<<x2<<endl<<x3;
}
