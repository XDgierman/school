/*
Szukanie pierwiaska wielowianu stopnia N w przedziale od <l;p>
1. Oblicz s=(l+p)/2
2. Jeżeli f(s)=0 to s jest pierwiastkiem równania, zakończ funkcję
3. Jeżeli f(l)*f(s)<0 to p=s, w przeciwnym wypasku l=s
4. Powtarzaj od 1 dopóki l<p

Znajdz pierwiastek równania x^3+2x^2-11x-12 w przedziale <0;100>
*/
#include <iostream>
using namespace std;

float Horner(int a[],float x, int n){
	float b=a[0];
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
		cout<<"podaj wspolczynnik nr. "<<i+1<<": ";
		cin>>a[i];
	}
	cout<<"podaj poczatek: ";
	float l;
	cin>>l;
	cout<<"podaj koniec: ";
	float p;
	cin>>p;
	float s;
	while(l<p){
		s=(l+p)/2.0;
		if ((int)Horner(a,s,n)==0){
			break;
		}
		if (Horner(a,l,n)*Horner(a,s,n)<0){
			p=s;
		} else l=s;
	};
	if (l>=p && s!=0){
		cout<<"Brak rozwiazania"<<endl;
		return 0;
	}
	else cout<<"Rozwiazanie to: "<<s;
	return 0;
}
