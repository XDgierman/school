#include <iostream>

using namespace std;

void sortuj(string tab, int l, int p){
	int i,j,s;
	char sr,temp;
	i=l;
	j=p;
	s=(l+p)/2;
	sr=tab[s];
	do
	{
		while (tab[i]<sr) i++;
		while (sr<tab[j]) j--;
		if (i<=j)
			{
				temp=tab[i];
				tab[i]=tab[j];
				tab[j]=temp;
				i++;
				j--;
			}
	}
	while (i<=j);
	if (l<j) sortuj(tab,l,j);
	if (i<p) sortuj(tab,i,p);
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
	for (int i=0; i<=a.length();i++){
		cout<<a[i]<<"  "<<w[i]<<endl;
	if (a[i]!=w[i]){
	return false;
	 }
	}
	return true;
}

bool anagram(string a, string b){
	string w="",z="";
	w=sortuj(a,0,a.length()-1);
	z=sortuj(b,0,b.length()-1);
	if (w.length()==z.length()){
		for (int i=0; i<=z.length();i++){
		if (z[i]!=w[i]){
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

int main(){
  cout<<anagram("ASBS","ABSS");
}
