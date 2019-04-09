#include <iostream>
#include <fstream>
#include "menu.h"
using namespace std;

int pot(int a, int b){
	int tmp=a;
	for (int i=0; i<b-1; i++){
		tmp=tmp*a;
	}
	return tmp;
}

bool test(string a, string b){
	for (int i=0; i<b.length();i++){
		if (a[i]!=b[i]){
			return false;
		}
	}
	return true;
}

bool bcdtest(string a){
	//cout<<a<<endl;
	int test=0;
	for (int i=0;i<4;i++){
	if (a[i]=='1'){
		if(i=0){
			test+=8;
			//cout<<test<<endl;
		} else if(i=1){
			test+=4;
			//cout<<test<<endl;
		} else if(i=2){
			test+=2;
			//cout<<test<<endl;
		} else {
			test+=1;
			//cout<<test<<endl;
		}
	}
	if (test>=10){
		return false;
	} else return true;
}

int fullend(string a){
	int p=a.length()-1,po=1, war=0;
	while (p>=0){
		if (po==1){
			if (a[p]=='1'){
				war+=1;
				po++;
				p--;
			} else {
				po++;
				p--;
			}
		} else {
			if (a[p]=='1'){
				war+=pot(2,po);
				po++;
				p--;
			} else {
				po++;
				p--;
			}
		}
	}
	return war;
}

int main() {
	ifstream file;
	bool dziala=true;
	int dl,bol=0,maxdl=-1,testbcd=0,nbcd=0,minbcd=9999,cal,najcal=-1;
	string bin,prebin,subin,maxbin,textbcd,texnajcal;
	file.open("binarne.txt");
	for (int i=0;i<500;i++){
		file>>bin;
		dl = bin.length();
		prebin=prefix(bin,(dl/2)-1);
		subin=sufix(bin,(dl/2));
		if(test(prebin,subin)){
			bol++;
			if (dl>maxdl){
				maxdl=dl;
				maxbin=bin;
			}
		}
		while (dziala==true) {
			//cout<<"Im in\n";
			testbcd+=4;
			//cout<<testbcd<<endl;
			if (testbcd>dl){
				dziala=false;
			} else {
				textbcd=substring(bin,testbcd-4,testbcd-1);
				if (bcdtest(textbcd)==false){
					nbcd++;
					if (dl<minbcd){
						minbcd=dl;
					}
					dziala=false;
				}
			}
		}
		testbcd=0;
		dziala=true;
		cal=fullend(bin);
		if (cal>0 && cal<65535){
			if (cal>najcal){
				najcal=cal;
				texnajcal=bin;
			}
		}
	}
	cout<<"Ilosc liczb dwucyklicznych - "<<bol<<"\nDlugosc najdluzszego - "<<maxdl<<"\nNajdluzsza liczba - "<<maxbin;
	cout<<"\nIlosc liczb nie bedacych BCD - "<<nbcd<<"\nDlugosc najkrotszej liczby nie bedacej BCD - "<<minbcd;
	cout<<"\nNajwieksza liczba binarna - "<<texnajcal<<"\nWartosc najwiekszej liczby binarnej - "<<najcal;
	return 0;
}
