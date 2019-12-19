#include <iostream>
using namespace std;

int ToInt(string x, int b){
    int out;
    if(x[0]>='0' and x[0]<='9'){
        out = (int)x[0]-48;
    } else if (b == 16 and x[0]>='A' and x[0]<='F'){
        out = (int)x[0]-55;
    } else if(b == 16 and x[0]>='a' and x[0]<='f'){
        out = (int)x[0]-87;
    } else return -1;
    for (int i = 1; i <= x.length()-1; i++){
        if(x[i]>='0' and x[i]<='9'){
            out = out * b + (int)x[i]-48;
        } else if (b == 16 and x[i]>='A' and x[i]<='F'){
            out = out * b + (int)x[0]-55;
        } else if(b == 16 and x[i]>='a' and x[i]<='f'){
            out = out * b + (int)x[i]-87;
        } else return -1;
    }
    return out;
}
string ToAny(int x, int p){
    string out="", rev="";
    int number;
    while(x != 0){
        number=x%p;
        if (number>=0 & number<=9) rev+=(char)number+48;
		else rev+=(char)number+87;
        x=x/p;
    }
    for (int i = rev.length() - 1; i >= 0; i--)
    {
        out += rev[i];
    }
    return out;
}
int main()
{
    string x;
    int b;
    cout<<"Wpisz liczbe"<<endl;
    cin>>x;
    system("cls");
    cout<<"Wpisz format liczby (hex - 16, dec - 10, oct - 8, bin - 2)"<<endl;
    cin>>b;
    if(ToInt(x,b)!=-1){
        system("cls");
        int p;
        cout<<"Wpisz format liczby docelowej (hex - 16, dec - 10, oct - 8, bin - 2)"<<endl;
        cin>>p;
        if(p > 16 or p < 2){
            system("cls");
            cout<<"Blad. Koniec Programu";
            return 0;
        } else
        {
            system("cls");
            cout<<"Wynik"<<endl<<x<<" = "<<ToAny(ToInt(x,b),p)<<endl;
            return 0;
        }
    } else
    {
        system("cls");
        cout<<"Blad. Koniec Programu";
        return 0;
    }
    return 0;
}
