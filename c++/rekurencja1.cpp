//oblicz funkcję rekurencyjną, obliczającą n-ty element ciągu arytmetycznego, gdzie wyraz a1=10, r=-2
//1. wyświetl 20 pierwszych wyrazów ciągu
//2. wyświetl wszstkie wyrazy ciągu >-100

#include <iostream>
using namespace std;

int rek1(int n){
  if (n==1) return 10;
  else return rek1(n-1)-2;
}
int rek2(int c){
  if (c==0) return 0;
  else return rek2(c/10)+c%10;
}
int main(){
  int n=1;
  do{
    cout<<rek1(n)<<endl;
    n++;
  }while(n<21);
 n=1;
 cout<<endl;
 cout<<endl;
 cout<<endl;
 cout<<endl;
 cout<<endl;
 do{
   cout<<rek1(n)<<endl;
   n++;
 }while(rek1(n)>-100);
 cout<<rek2(658);
}
