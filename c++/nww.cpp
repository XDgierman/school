#include <iostream>

using namespace std;

void nnw (int a, int b, int c, int d, char e){
  int i1=1, i2=1,bp=b,dp=d,wyn,aw,cw;
  do{
    if (b<d){
      b+=bp;
      cout<<b<<endl;
      i1++;
    }
    else {
      d+=dp;
      cout<<d<<endl;
      i2++;
    };
  }while (b!=d);
  aw=a*i1;
    cout<<aw<<endl;
  cw=c*i2;
    cout<<cw<<endl;
  switch (e){
    case '+':
    wyn=aw+cw;
    cout<<"Wynik: "<<a<<'/'<<bp<<" + "<<c<<'/'<<dp<<" = "<<wyn<<'/'<<b<<endl;
    break;
    case '-':
    wyn=aw-cw;
    cout<<"Wynik: "<<a<<'/'<<bp<<" - "<<c<<'/'<<dp<<" = "<<wyn<<'/'<<b<<endl;
    break;
    case '*':
    wyn=aw*cw;
    cout<<"Wynik: "<<a<<'/'<<bp<<" * "<<c<<'/'<<dp<<" = "<<wyn<<'/'<<b<<endl;
    break;
    case '/':
    wyn=aw/cw;
    cout<<"Wynik: "<<a<<'/'<<bp<<" / "<<c<<'/'<<dp<<" = "<<wyn<<'/'<<b<<endl;
    break;
  }
  }

int main(){
	int a,b,c,d;
	char e;
  cout<<"Podaj liczebnik pierwszej liczby: ";
  cin>>a;
  cout<<endl;
  cout<<"Podaj mianownik pierwszej liczby: ";
  cin>>b;
  cout<<endl;
  cout<<"Podaj liczebnik drugiej liczby: ";
  cin>>c;
  cout<<endl;
  cout<<"Podaj mianownik drugiej liczby: ";
  cin>>d;
  cout<<endl;
  cout<<"Podaj co ma zrobic: ";
  cin>>e;
  cout<<endl;
  nnw(a,b,c,d,e);
}
