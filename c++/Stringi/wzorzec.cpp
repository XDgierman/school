#include <iostream>

using namespace std;

string substring (string a,int p, int k){
	string w="";
	for (int i=p;i<=k;i++){
		w+=a[i];
	}
	return w;
}

int wzorzec(string a, string b){
  for(int i=1;i<a.length();i++){
    if (substring(a,i-1,i)==b){
      return i-1;
    }
  }
  return -1;
}

int main(){
  cout<<wzorzec("ABCDEFGH", "DE")<<endl;
}
