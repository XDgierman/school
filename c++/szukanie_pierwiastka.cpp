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

int Horner(int a[],int x, int n){
	int b=a[0];
	for (int i=1;i<=n;i++){
		b=b*x+a[i];
	}
	return b;
}

int main(){
	int a[4]=[1,2,11,12];
	int n=3, l=0, p=100, s;
	do{
		s=(l+p)/2;
		if (Horner(a[],s,n)==0){
			l=p+1;
		}
	}while(l<p)
}
