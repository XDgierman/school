#include <iostream>

using namespace std;

string sortowanie(string t, int ile){
	char temp;
	for(int i=0;i<ile;i++){
		for (int j=0;j<ile-1;j++){
			if(t[j]>t[j+1]){
				temp=t[j];
				t[j]=t[j+1];
				t[j+1]=temp;
			}
		}
	}
	return t;
}

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
	if (a==w){
		return true;
	} else return false;
}

bool anagram(string a, string b){
	string w,z;
	w=sortowanie(a,a.length());
	z=sortowanie(b,b.length());
	if (w.length()==z.length()){
		for (int i=0; i<=z.length();i++){
		if (w[i]!=z[i]){
		return false;
		 }
		}
		return true;
	} else return false;
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
	string w=""; int i=0;
	while (a[i]==' '){
		i++;
	}
	while (i<a.length()){
		if (a[i]!=' '){
			w+=a[i];
			i++;
		} else {
			while (a[i]==' '){
				i++;
			}
			if (i!=a.length()){
				w+=' ';
			}
		}
	}
	return w;
}
