#include <iostream>
#include <cstdlib>

using namespace std;

string caesar(string a, int n) {
	int k;
	string w = "";
	for (int i = 0; i < a.length(); i++)
	{
		k = (int)a[i] - 65;
		k += n;
		if (k >= 26) k %= 26;
		w += (char)(k + 65);
	}
	return w;
}

string decaesar(string a, int n) {
	int k;
	string w = "";
	for (int i = 0; i < a.length(); i++)
	{
		k = (int)a[i] - 65;
		k -= n%26;
		if (k <= 0) {
			k += 26;
		}
		if (k >= 26) {
			k -= 26;
		}
		w += (char)(k + 65);
	}
	return w;
}


string caesar_word(string a, string n) {
	int k, in = 0, wn;
	string w = "";
	for (int i = 0; i < a.length(); i++) {
		if (in == n.length()) {
			in = 0;
			wn = (int)n[in] - 64;
			in++;
		}
		else {
			wn = (int)n[in] - 64;
			in++;
		}
		k = (int)a[i] - 65;
		k += wn;
		if (k >= 26) k %= 26;
		w += (char)(k + 65);
	}
	return w;
}
string decaesar_word(string a, string n) {
	int k, in = 0, wn;
	string w = "";
	for (int i = 0; i < a.length(); i++) {
		if (in == n.length()) {
			in = 0;
			wn = (int)n[in] - 64;
			in++;
		}
		else {
			wn = (int)n[in] - 64;
			in++;
		}
		k = (int)a[i] - 65;
		k -= wn%26;
		if (k <= 0) {
			k += 26;
		}
		if (k >= 26) {
			k -= 26;
		}
		w += (char)(k + 65);
	}
	return w;
}
