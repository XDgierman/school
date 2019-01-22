#include <iostream>
#include <cstdlib>

using namespace std;

string caesar (string a, string n){
	int k, in=0, wn;
	string w="";
	for (int i=0;i<a.length();i++){
		if (in==n.length()){
			in=0;
			wn=(int)n[in]-64;
			in++;
		} else {
			wn=(int)n[in]-64;
			in++;
		}
		k=(int)a[i]-65;
		k+=wn;
		if (k>=26) k%=26;
		w+=(char)(k+65);
	}
	return w;
}
string decaesar (string a, string n){
	int k, in=0, wn;
	string w="";
	for (int i=0;i<a.length();i++){
		if (in==n.length()){
			in=0;
			wn=(int)n[in]-64;
			in++;
		} else {
			wn=(int)n[in]-64;
			in++;
		}
		k=(int)a[i]-65;
		k-=wn;
		while (k<=0){
			k+=26;
		}
		if (k+65>=91){
			k-=26;
		}
		w+=(char)(k+65);
	}
	return w;
}
