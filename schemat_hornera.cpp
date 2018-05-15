/*Schemat Hornera
napisz funkcjê do której przeka¿esz liczbê binarn¹, a zwrócisz jej wartoœæ dziesiêtn¹*/
#include <iostream>
using namespace std;
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
int main(){
	int w=100;
	string a;
	while (w!=0){
		cout<<"Wybierz konwersje:"<<"\n1.Binarne do dziesietne"<<"\n2.Oktalne do dziesietne"<<"\n3.Heksagonalne do dziesietne"<<"\n4.Dziesietne do binarnych"<<"\n5.Dziesietne do oktalnych"<<"\n6.Dziesietne do heksagonalnych"<<"\n0.Koniec"<<endl;
		cin>>w;
switch (w){
	case 1: {
		system("cls");
	cout<<"Wpisz liczbe"<<endl;
	cin>>a;
	cout<<ToDec(a,2)<<endl;
		break;
	}
	case 2: {
		system("cls");
	cout<<"Wpisz liczbe"<<endl;
	cin>>a;
	cout<<ToDec(a,8)<<endl;
		break;
	}
	case 3: {
		system("cls");
	cout<<"Wpisz liczbe"<<endl;
	cin>>a;
	cout<<ToDec(a,16)<<endl;
		break;
	}
	case 4: {
		system("cls");
	cout<<"Wpisz liczbe"<<endl;
	cin>>a;
	cout<<ToAny(a,2)<<endl;
		break;
	}
	case 5: {
		system("cls");
	cout<<"Wpisz liczbe"<<endl;
	cin>>a;
	cout<<ToAny(a,8)<<endl;
		break;
	}
	case 6: {
		system("cls");
	cout<<"Wpisz liczbe"<<endl;
	cin>>a;
	cout<<ToAny(a,16)<<endl;
		break;
	}
/*	case 7: {
		system("cls");
	cout<<"Wpisz liczbe"<<endl;
	cin>>a;
	cout<<ToAnyInt(ToDec(a,2),16)<<endl;
		break;
	}*/			
	case 0: {return 0;
	}
	default:{
	system("cls");
	cout<<"Nie ma takiej konwersji"<<endl;
		break;
	}
}
}
}
