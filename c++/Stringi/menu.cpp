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
	for (int i=0; i<=a.length();i++){
	if (a[i]!=w[i]){
	return false;
	 }
	}
	return true;
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

int main(){
	string s, as;
	int p,k,a;
	do {
		cout<<"Wybierz opcje"<<endl;
		cout<<"1. Substring"<<endl;
		cout<<"2. Prefix"<<endl;
		cout<<"3. Sufix"<<endl;
		cout<<"4. Palindrom"<<endl;
		cout<<"5. Anagram"<<endl;
		cout<<"6. Wzorzec"<<endl;
		cout<<"7. Usuwanie spacji"<<endl;
		cout<<"8. Usuwanie zbednych spacji"<<endl;
		cout<<"0. Wyjscie z programu"<<endl;
		cin>>a;
		switch (a){
			case 0:
				cout<<"Koniec aplikacji"<<endl;
				break;
			case 1: //substring
				cin.ignore();
				cout<<"Prosze wpisac tekst"<<endl;
				getline(cin,s);
				cout<<"Prosze wpisac poczatek i koniec"<<endl;
				cin>>p;
				cin>>k;
				if (p<s.length() || k<s.length() || p>s.length()-1 || k>s.length()-1){
					cout<<"Wpisales wartosci z poza zakresu!"<<endl;
					break;
				}else if (p>k){
					cout<<"Wpisales liczby odwrotnie!"<<endl;
					break;
				}
				cout<<"Wynik operacji: "<<substring(s,p,k)<<endl;
				break;
			case 2: //Prefix
				cin.ignore();
				cout<<"Prosze wpisac tekst"<<endl;
				getline(cin,s);
				cout<<"Prosze wpisac koniec"<<endl;
				cin>>k;
				if (k<s.length() || k>s.length()-1){
					cout<<"Wpisales wartosci z poza zakresu!"<<endl;
					break;
				}
				cout<<"Wynik operacji: "<<prefix(s,k)<<endl;
				break;
			case 3: //Sufix
				cin.ignore();
				cout<<"Prosze wpisac tekst"<<endl;
				getline(cin,s);
				cout<<"Prosze wpisac poczatek"<<endl;
				cin>>p;
				if (p<s.length() || p>s.length()-1){
					cout<<"Wpisales wartosci z poza zakresu!"<<endl;
					break;
				}
				cout<<"Wynik operacji: "<<sufix(s,p)<<endl;
				break;
			case 4: //Palindrom
				cin.ignore();
				cout<<"Prosze wpisac tekst"<<endl;
				getline(cin,s);
				if (palindrom(s)){
					cout<<"Tekst jest palindromem"<<endl;
				} else {
					cout<<"Tekst nie jest palindromem"<<endl;
				}
				break;
			case 5: //Anagram
				cin.ignore();
				cout<<"Prosze wpisac tekst pierwszy"<<endl;
				getline(cin,s);
				cout<<"Prosze wpisac tekst drogi"<<endl;
				getline(cin,as);
				if (anagram(s,as)){
					cout<<"Teksty sa anagramami"<<endl;
				} else {
					cout<<"Teksty nie sa anagramami"<<endl;
				}
				break;
			case 6: //Wzorzec
				cin.ignore();
				cout<<"Prosze wpisac tekst (dluzszy niz 2 litery)"<<endl;
				getline(cin,s);
				if (s.length()<2){
					cout<<"Tekst jest za krotki!"<<endl;
					break;
				}
				cout<<"Prosze wpisac wzorzec (2 litery)"<<endl;
				getline(cin,as);
				if (as.length()!=2){
					cout<<"Nie wpisano 2 liter!"<<endl;
					break;
				}
				if (wzorzec(s,as)==-1){
					cout<<"W tekscie nie ma podanego wzorca"<<endl;
				}
				else {
					cout<<"W tekscie najblizszy wzorzec pojawia sie na pozycji "<<wzorzec(s,as)<<endl;
				}
				break;
			case 7: //usuwanie spacji
				cin.ignore();
				cout<<"Prosze wpisac tekst"<<endl;
				getline(cin,s);
				cout<<"Oto tekst bez spacji: "<<spcrem(s)<<endl;
				break;
			case 8: //usuwanie zbednych spacji
				cin.ignore();
				cout<<"Prosze wpisac tekst"<<endl;
				getline(cin,s);
				cout<<"Oto tekst bez zbednych spacji: "<<spcremzb(s)<<endl;
				break;
			default:
				cout<<"Nie ma takiej opcji w menu"<<endl;
				break;
		}
	}
	while (a!=0);
	}
