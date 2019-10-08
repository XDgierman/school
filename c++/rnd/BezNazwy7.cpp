#include <iostream>
using namespace std;

int main(){

int a;
cout<<"Wpisz numer dnia: ";
cin>>a;

switch (a){
	case 1: {cout<<"pn";
		break;
	}
	case 2: {cout<<"wt";
		break;
	}
	case 3: {cout<<"sr";
		break;
	}
	case 4: {cout<<"cz";
		break;
	}
	case 5: {cout<<"pt";
		break;
	}
	case 6: {cout<<"sb";
		break;
	}
	case 7: {cout<<"nd";
		break;
	}
	default:cout<<"Nie ma takiego dnia";
}


	return 0;
}
