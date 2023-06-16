package jpsgcs.alun.viewgraph;

import java.awt.Color;
import java.awt.Graphics;

public class Blob implements VertexRepresentation
{
	public boolean contains(double a, double b)
	{
		if (a < -h || a > h)
			return false;
		if (b < -h || b > h)
			return false;
		return true;
	}
	
	public void paint(Graphics g, double dx, double dy, boolean b)
	{
		int x = (int)(dx-w);
		int y = (int)(dy-h);
		g.setColor( col );

		switch(shape)
		{
		case 0:
			if (!transp)
				g.fillRect( x, y, 2*w, 2*h );
			g.setColor(b? border0: border1);
			g.drawRect( x, y, 2*w, 2*h );
	
			if (diag > 0)
			{
				g.setColor(diagcolor);
				g.drawLine(x,y,x+2*w,y+2*h);
				g.drawLine(x+2*w,y,x,y+2*h);
			}
			break;

		case 1:
		default:
			if (!transp)
				g.fillOval( x, y, 2*w, 2*h );
			g.setColor(b? border0: border1);
			g.drawOval( x, y, 2*w, 2*h );
			if (diag > 0)
			{
				g.setColor(diagcolor);
				g.drawLine(x,y,x+2*w,y+2*w);
				g.drawLine(x+2*w,y,x,y+2*h);
			}
		}
	}

	public void setColor(Color c)
	{
		col = c;
	}

	public void setBorderColors(Color c, Color d)
	{
		border0 = c;
		border1 = d;
	}

	public void setSize(int i, int j)
	{
		w = i;
		h = j;
	}

	public void setShape(int i)
	{
		shape = i;
	}

	public void setTransparent(boolean b)
	{
		transp = b;
	}

	public void setBorder(Color c)
	{
		border0 = c;
	}

	public void setDiagonals(int d)
	{
		diag = d;
	}

	public void setDiagonalColor(Color c)
	{
		diagcolor = c;
	}

// Private data.

	private Color col = Color.yellow;
	private Color border0 = Color.black;
	private Color border1 = Color.red;
	protected int w = 8;
	protected int h = 8;
	private int shape = 0;
	private int diag = 0;
	private Color diagcolor = Color.black;
	private boolean transp = false;
}
