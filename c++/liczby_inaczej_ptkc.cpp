#include <iostream>
#include <fstream>

using namespace std;

int StrToInt(string a){
	int x=(int)a[0]-48;
	for (int i=1; i<=a.length()-1;i++){
		x=x*10+(int)a[i]-48;
	}
	return x;
}
int ToDec (string a, int p){
	int c;
	if (a[0]>='0' & a[0]<='9'){c=(int)a[0]-48;}
		else if (a[0]>='a' & a[0]<='f') c=(int)a[0]-87;
			else if (a[0]>='A' & a[0]<='F') c=(int)a[0]-55;
	else return -1;
	for (int i=1;i<a.length();i++){
		int d;
		if (a[i]>='0' and a[i]<='9')d=(int)a[i]-48;
			else if (a[i]>='a' and a[i]<='f') d=(int)a[i]-87;
				else if (a[i]>='A' and a[i]<='F') d=(int)a[i]-55;
		else return -1;
		c=c*p+d;
	}
	return c;
}
string ToAny (string a, int p){
	string w="",o="";
	int r, le;
	int l=StrToInt(a);
	while (l!=0){
		r=l%p;
		if (r>=0 & r<=9) w+=(char)r+48;
		else w+=(char)r+87;
		l=l/p;
}
	le=w.length();
	for (int i=le-1; i>=0;i--){
		o+=w[i];
}
	return o;
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
  ifstream file;
  file.open("liczby_inaczejtxt.txt");
  string liczba, suma;
	int przemiana, bin=0, liczba1=0;;
  for (int i=0;i<1000;i++){
    file>>liczba;
		przemiana=ToDec(liczba,2);
    if (liczba.length()==9){
      liczba1++;
			bin+=przemiana;
    }
		suma=ToAnyInt(bin,2);
  }
  cout<<liczba1<<"   "<<suma;
}
