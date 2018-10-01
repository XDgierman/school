#include <iostream>
#include <cstdlib>
#include <ctime>

using namespace std;

void losuj(int t[], int n){
  srand(time(NULL));
  for (int i=0;i<n;i++){
  	t[i]=rand()%199-99;
  }
};
void wyswietl(int t[], int n){
  for (int i=0;i<n;i++){
  	cout.width(4);
  	cout<<t[i];
  }
  cout<<endl;
};
bool wyszukaj_l(int t[], int n, int s){
int i=0;
do{
  //cout<<i<<" "<<t[i]<<endl;
  if (t[i]==s) return true;
  i++;
}while (i<n);
return false;
};
bool wyszukaj_b(int t[], int n, int s){
  int a=0,z=n;
  do{
    n=/n;
    if (t[n]<s) z=n;

  }while()
};
void sortuj(int t[], int n){
  int l=0,m,i,min,tmp;
  while (l<n-1){
  min=999999;
  for (i=l;i<n;i++){
    if (t[i]<min){
      min=t[i];
      m=i;
    }
  }
    tmp=t[l];
    t[l]=t[m];
    t[m]=tmp;
  l++;
};
};

int main() {
  int ile=100, szuk;
  int tab[ile];
  losuj(tab,ile);
  sortuj(tab,ile);
  wyswietl(tab,ile);
  cout<<"Szukaj: ";
  cin>>szuk;
  cout<<endl;
  //if (wyszukaj_l(tab,ile,szuk)==true) cout<<"Jest"<<endl;
  if (wyszukaj_b(tab,ile,szuk)==true) cout<<"Jest"<<endl;
  else cout<<"Nie ma"<<endl;
}
