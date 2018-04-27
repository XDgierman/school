#include <iostream>
using namespace std;

/*void rozklad(int x){
	int x1=0, x2=0, x3=0, x4=0, x5=0;
	do{
		if(x%2==0){
			x1++;
			x=x/2;
		}
		else if(x%3==0){
			x2++;
			x=x/3;
		}
		else if(x%5==0){
			x3++;
			x=x/5;
		}
		else if(x%7==0){
			x4++;
			x=x/7;
		}
		else if(x%11==0){
			x5++;
			x=x/11;
		};
	}while(x > 1);
	cout<<2<<"    "<<x1<<endl;
	cout<<3<<"    "<<x2<<endl;
	cout<<5<<"    "<<x3<<endl;
	cout<<7<<"    "<<x4<<endl;
	cout<<11<<"    "<<x5<<endl;
}*/

/*void rozklad(int x){
	int l=0, c=2;
	while(x > 1){
		if(x%c==0){
			l++;
			x=x/c;
		}
		else {
		cout<<c<<"    "<<l<<endl;
		l=0;
		c++;
	}
	};
}*/

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
	pierwsza(l);
}
