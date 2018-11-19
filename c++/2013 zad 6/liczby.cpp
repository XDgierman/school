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
string IntToStr(int a){
     string x, z;
     if(a < 0) {
      z = "-";
      a = -a;
     }
     do {
      x += a % 10 + 48;
      a -= a % 10;
     }
     while(a /= 10);
     for(int i = x.size()-1; i >= 0; i--)
      z += x[i];
     return z;
}
int ToDec (string a, int p){
	int c;
	if (a[0]>='0' & a[0]<='9'){c=(int)a[0]-48;}
		else if (a[0]>='a' & a[0]<='z') c=(int)a[0]-87;
			else if (a[0]>='A' & a[0]<='Z') c=(int)a[0]-55;
	else return -1;
	for (int i=1;i<a.length();i++){
		int d;
		if (a[i]>='0' and a[i]<='9')d=(int)a[i]-48;
			else if (a[i]>='a' and a[i]<='z') d=(int)a[i]-87;
				else if (a[i]>='A' and a[i]<='Z') d=(int)a[i]-55;
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
  file.open("dane.txt");
  string text, dzi;
  int ilosc1=0, ilosc2=0, ilosc3=0;
  int j;
  bool test=true;
  int min=999999999, max=-1;
  for (int i=0;i<5000;i++){
    file>>text;
    if (text[0]==text[text.length()-1]){
      ilosc1++;
    }
    dzi=IntToStr(ToDec(text,8));
    if (dzi[0]==dzi[dzi.length()-1]){
      ilosc2++;
    }
    j=0;
    test=true;
    do{
      if (text[j]<=text[j+1]){
        j++;
      } else {
        test=false;
        break;
      }
    }while (j<=text.length()-2);
    if (test){
      if (StrToInt(text)>max){
        max=StrToInt(text);
      } else if (StrToInt(text)<min){
        min=StrToInt(text);
      }
      ilosc3++;
    }
  }
  cout<<ilosc1<<endl<<ilosc2<<endl<<ilosc3<<endl<<max<<endl<<min;
}
