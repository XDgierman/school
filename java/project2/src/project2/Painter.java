package project2;

import java.applet.*;
import java.awt.Color;
import java.awt.Graphics;
import java.awt.event.*;
import java.util.Random;

public class Painter extends Applet implements MouseListener{
	private int x,y,c=1;
	int[][] tab = new int[500][500];
	Color[] tabColor = new Color[500];
	public
	Random r=new Random();
	Color k = new Color(r.nextInt());
	
	public void init()
		{
		addMouseListener(this);
		}


	public void paint (Graphics gDC)
		{
		for (int i=0;i<c-1;i=i+1) {
			gDC.setColor(tabColor[i]);
			gDC.fillRect(tab[i][0],tab[0][i], 30, 30);
		}
		gDC.setColor(k);
		 gDC.fillRect(x-15, y-15, 30, 30);
		}


	public void mouseClicked(MouseEvent evt){
		x = evt.getX();
		y = evt.getY();
		tab[c][0]=x-15;
		tab[0][c]=y-15;
		tabColor[c]=k;
		c=c+1;
		repaint();
	}
	public void mousePressed(MouseEvent evt) {
		//x = evt.getX();
		//y = evt.getY();
		//repaint();
	}
	public void mouseExited(MouseEvent evt) {}
	public void mouseEntered(MouseEvent evt) {}
	public void mouseReleased(MouseEvent evt) {
		k = new Color(r.nextInt());
	}
}
