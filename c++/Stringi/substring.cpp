#include <iostream>  

using namespace std; 
 
string substring (string a,int p, int k){
	string w="";
	for (int i=p;i<=k;i++){
		w+=a[i];
	}
	return w;
}
 
int main(){ 
cout<<substring("ABCDEFGH",3,6);
}

