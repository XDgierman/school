#include <iostream>
using namespace std;

bool pierwsza(int x){
	int c=2;
	while(x =! 0){
		if (c>=x) return false;
		else if (x%c!=0) c++;
		else if (x%c==0) return true;
	}
}
int main(){
	int l=11;
	if (pierwsza(l)) cout<<true;
}
