package jpsgcs.alun.viewgraph;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.Polygon;

public class StringNode implements VertexRepresentation
{
	public StringNode(String s)
	{
		this(s,Color.yellow);
	}

	public StringNode(String s, Color c)
	{
		this(s,c, Color.black, Color.black, Color.red, 0);
	}

	public StringNode(String s, Color c, int shape)
	{
		this(s,c, Color.black, Color.black, Color.red, shape);
	}

	public StringNode(String s, Color cbackground, Color ctext, Color cborder0, Color cborder1, int h)
	{
		name = s;

		background = cbackground;
		text = ctext;
		border0 = cborder0;
		border1 = cborder1;

		diagcolor = background;
		
		setShape(h);
	}

	public StringNode(StringNode s)
	{
		name = s.name;
		background = s.background;
		text = s.text;
		border0 = s.border0;
		border1 = s.border1;
		setShape(s.shape);
		diagcolor = s.diagcolor;
		diag = s.diag;
	}
	
	public void paint(Graphics g, double dx, double dy, boolean b)
	{
		if (!sizeset)
			setSize(g);

		int x = (int)(dx);
		int y = (int)(dy);
		
		g.setColor( background );

		switch(shape)
		{
		case 1: drawOval(g,x,y,w,h,true);
			break;
		case 2: drawDiamond(g,x,y,w,h,true);
			break;
		case 0:
		default:
			drawRect(g,x,y,w,h,true);
			break;
		}

		g.setColor(b ? border0 : border1);

		switch(shape)
		{
		case 1: drawOval(g,x,y,w,h,false);
			break;
		case 2: drawDiamond(g,x,y,w,h,false);
			break;
		case 0:
		default:
			drawRect(g,x,y,w,h,false);
			break;
		}

		if (diag > 0)
		{
			g.setColor(diagcolor);
                        g.drawLine(x,y,x+2*w,y+2*w);
                        g.drawLine(x+2*w,y,x,y+2*h);
		}

		g.setColor(text);

		g.drawString(name,x-w+xfill,y-h+2*(h-yfill));
	}
	
	public boolean contains(double a, double b)
	{
		if (a < -w || a > w)
			return false;
		if (b < -h || b > h)
			return false;
		return true;
	}

	public void setColor(Color c)
	{
		background = c;
	}

	public Color getColor()
	{
		return background;
	}

	public void setTextColor(Color c)
	{
		text = c;
	}

	public void setBorderColors(Color c, Color d)
	{
		border0 = c;
		border1 = d;
	}

	public void setShape(int h)
	{
		shape = h;
	}

	public int getShape()
	{
		return shape;
	}

	public void reverse()
	{
		background = reverse(background);
		text = reverse(text);
		border0 = reverse(border0);
		border1 = reverse(border1);
	}

	public int width()
	{
		return w;
	}

	public int height()
	{
		return h;
	}

	public void setDiagonals(int b)
	{
		diag = b;
	}

	public void setDiagonalColor(Color b)
	{
		diagcolor = b;
	}

	public String getString()
	{
		return name;
	}
	
	public void fixSize(int fw, int fh)
	{
		if (fw >= 0 || fh >= 0)
		{
			w = fw;
			h = fh;
			sizeset = true;
			fixed = true;
		}
		else
		{
			fixed = false;
			sizeset = false;
		}
	}

	public boolean isFixedSize()
	{
		return fixed;
	}

	public void unfixSize()
	{
		fixed = false;
		sizeset = false;
	}

	public void setString(String s)
	{
		name = s;
		sizeset = false;
	}

// Private data.

	protected String name = null;
	protected Color background = null;
	protected Color text = null;
	protected Color border0 = null;
	protected Color border1 = null;

	protected Color diagcolor = null;

	protected boolean mono = false;

	protected int diag = 0;

	protected int shape = 0;
	protected int w = 8;
	protected int h = 8;
	protected boolean sizeset = false;
	protected boolean fixed = false;
	protected int xfill = 4;
	protected int yfill = 2;

	private Color reverse(Color c)
	{
		int r = 255-c.getRed();
		int g = 255-c.getGreen();
		int b = 255-c.getBlue();
		return new Color(r,g,b);
	}

	protected void drawRect(Graphics g, int xx, int yy, int ww, int hh, boolean fill)
	{
		int w = ww-1;
		int h = hh-1;
		int x = xx-w;
		int y = yy-h;

		if (fill)
			g.fillRect(x,y,2*w,2*h); 
		else
			g.drawRect(x,y,2*w,2*h); 
	}

	protected void drawOval(Graphics g, int xx, int yy, int ww, int hh, boolean fill)
	{
		int w = ww;
		int h = hh;
		int x = xx-w;
		int y = yy-h;

		if (fill)
			g.fillOval(x,y,2*w,2*h); 
		else
			g.drawOval(x,y,2*w,2*h); 
	}

	protected void drawDiamond(Graphics g, int xx, int yy, int ww, int hh, boolean fill)
	{
		int w = ww+2;
		int h = hh+2;
		int x = xx;
		int y = yy;

		int[] xxx = {x-w, x, x+w, x};
		int[] yyy = {y, y+h, y, y-h};
		Polygon p = new Polygon(xxx,yyy,4);
		
		if (fill)
			g.fillPolygon(p);
		else
			g.drawPolygon(p);
	}

	protected void setSize(Graphics g)
	{
		w = xfill + g.getFontMetrics().stringWidth(name) / 2;
		h = yfill + g.getFontMetrics().getHeight() / 2;
		sizeset = true;
	}
}
