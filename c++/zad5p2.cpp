#include <iostream>
#include <fstream>

using namespace std;

string reverse(string a){
  string w="";
  for (int i=a.length()-1;i>=0;i--){
	w+=a[i];
}
return w;
}

int main(){
ifstream file;
ifstream nowe;
file.open("slowa.txt");
nowe.open("nowe.txt");
string a;
string t1[25];
string t2[25];
int t1i[25], t2i[25];
for (int i=0;i<25;i++){
  nowe>>t1[i];
  t2[i]=reverse(t1[i]);
  /*cout<<t1[i];
  cout.width(20);
  cout<<t2[i]<<endl;  */
  t1i[i]=0;
  t2i[i]=0;
}
for (int i=0;i<1000;i++){
file>>a;
for (int j=0;j<25;j++){
  if (a==t1[j]){
    t1i[j]++;
  }
  if (a==t2[j]){
    t2i[j]++;
  }
}
}
for (int i=0;i<25;i++){
  cout<<t1[i];
  cout.width(10+(12-t1[i].length()));
  cout<<t1i[i];
  cout.width(10);
  cout<<t2i[i]<<endl;
}
}
