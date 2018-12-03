#include <iostream>

using namespace std;

string substring (string a,int p, int k){
	string w="";
	for (int i=p;i<=k;i++){
		w+=a[i];
	}
	return w;
}

string prefix (string a,int p){
	string w="";
	for (int i=0;i<=p;i++){
		w+=a[i];
	}
	return w;
}

string sufix (string a,int p){
	string w="";
	for (int i=a.length()-p;i<=a.length();i++){
		w+=a[i];
	}
	return w;
}

bool palindrom (string a){
	string w="";
	for (int i=a.length()-1;i>=0;i--){
	w+=a[i];
	}
	for (int i=0; i<=a.length();i++){
		cout<<a[i]<<"  "<<w[i]<<endl;
	if (a[i]!=w[i]){
	return false;
	 }
	}
	return true;
}

int wzorzec(string a, string b){
  for(int i=1;i<a.length();i++){
    if (substring(a,i-1,i)==b){
      return i-1;
    }
  }
  return -1;
}

string spcrem (string a){
	string w="";
	for (int i=0;i<=a.length();i++){
		if (a[i]==' ') {
			i++;
		}
		w+=a[i];
	}
	return w;
}

string spcremzb (string a){
	string w="";
	for (int i=0;i<=a.length();i++){
		if (a[i-1]==' ') {
			if (a[i]=' '){
			i++;
			}
		}
		else if (a[i]==' ' and a[i+1]==' '){
			i+=2;
	}
		w+=a[i]; //test
	}
	return w;
}

int main(){
  cout<<spcremzb(" AASD SD   ASD");
}
