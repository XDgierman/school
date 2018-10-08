#include <iostream>
#include <math.h>
#include <fstream>
using namespace std;

bool czy_pierwsza(int x){
	if (x>2){
	if (x%2==0) return false;}
	int dz=3;
	while (dz<=sqrt(x)){
		if (x%dz==0){
			return false;
		}
		else dz++;
	}
	return true;
}
int cyfry(int x){
  int z=0;
  while(x!=0){
    z+=x%10;
    x/=10;
  };
  return z;
}
int StrToInt(string a){
	int x=(int)a[0]-48;
	for (int i=1; i<=a.length()-1;i++){
		x=x*10+a[i]-48;
	}
	return x;
}
string ToAnyInt (int a, int p){
string w="",o="";
int r, le;
while (a!=0){
r=a%p;
if (r>=0 & r<=9) w+=(char)r+48;
	else w+=(char)r+87;
a=a/p;
}
le=w.length();
for (int i=le-1; i>=0;i--){
	o+=w[i];
}
return o;
}
int main(){
  ofstream plik1;
  ofstream plik2;
  ofstream plik3;
  plik1.open("wynik1.txt");
  plik2.open("wynik2.txt");
  plik3.open("wynik3.txt");
  int uno=0, dos=0, tres=0;
  for (int i=2;i<1000;i++){
    if (czy_pierwsza(i)){
      if (czy_pierwsza(cyfry(i))){
        plik1<<i<<endl;
        uno++;
      }
    }
    }
  for (int i=100;i<10000;i++){
    if (czy_pierwsza(i)){
      if (czy_pierwsza(cyfry(i))){
        if (czy_pierwsza(cyfry(StrToInt(ToAnyInt(i,2))))){
        plik2<<i<<endl;
        dos++;}
      }
    }
    }
  for (int i=1000;i<100000;i++){
    if (czy_pierwsza(i)){
      if (czy_pierwsza(cyfry(i))){
        plik3<<i<<endl;
        tres++;
      }
    }
    }
    cout<<uno<<endl<<dos<<endl<<tres<<endl;
}
