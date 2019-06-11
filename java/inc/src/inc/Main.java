package inc;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JApplet;
import javax.swing.JButton;


public class Main extends JApplet {
	JButton guzik = new JButton("Tyci applecik");
	public void init(){
		System.out.print("parameter= " + getParameter("param"));

		guzik.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent e) {
				System.out.print("Przycisk został wciśnięty");
			}
		});
		getContentPane().add(guzik);
	}
}
