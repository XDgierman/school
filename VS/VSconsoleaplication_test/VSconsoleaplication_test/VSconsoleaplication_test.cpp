﻿#include <iostream>
using namespace std;

float potega(float x, int y) {
	float tmp = x;
	if (y = 1) {
		return tmp;
	}
	else if (y = 0) {
		return 1;
	}
	else {
		for (int i = 1; i < y; i++) {
			tmp = tmp * x;
		}
	return tmp;
	}
}
float pierwiastek(float x, int n) {
	float a = x / 2.0;
	if (a < 0) a = (-1) * a;
	for (int i = 1; i < 10; i++){
		a = (1.0 / n) * ((n - 1) * a + (x / potega(a, n - 1)));
		cout << a << endl;
	}
}
int main() {
	//cout << potega(3, 3) << endl;
	pierwiastek(100.0, 3);
	cin.get();
	return 0;
}
