#include <iostream>
#include <cstdlib>
#include <ctime>

using namespace std;

int main(){
	srand (time(NULL));
	int tab[100],i=0,tmp;
	do{
		tmp=rand()%1999-1000;
	if (tmp>=100 || tmp<=999 && tmp<=-100 || tmp>=-999)
	{tab[i]=tmp;
	cout<<tab[i];
	i++;
	}
}
}while i<100;
	
}
