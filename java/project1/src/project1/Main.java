package project1;

import javax.swing.*;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Calc object = new Calc();
		String A=JOptionPane.showInputDialog("Podaj liczbê");
		int a;
		try{a=Integer.parseInt(A);}
		catch(Exception e1) {
			A=JOptionPane.showInputDialog("Podaj prawid³ow¹ liczbê");
			a=Integer.parseInt(A);
		}
		object.setX(a);
		String B=JOptionPane.showInputDialog("Podaj dzia³anie");
		String b=B;
		object.setC(b);
		String C=JOptionPane.showInputDialog("Podaj drug¹ liczbê");
		int c;
		try{c=Integer.parseInt(C);}
		catch(Exception e2) {
			C=JOptionPane.showInputDialog("Podaj prawid³ow¹ liczbê");
			c=Integer.parseInt(C);
		}
		object.setY(c);
	}

}
