package jpsgcs.alun.graph;

import jpsgcs.alun.util.Point;

public class Coord extends jpsgcs.alun.util.Point
{
	public boolean m = true;
	public boolean h = true;
	public boolean v = true;
	public double x0 = 0;
	public double y0 = 0;

	public Coord()
	{
	//	super();
	//	this(10*GraphLocator.randu(),-500+10*GraphLocator.randu());
		this(10*GraphLocator.randu(),10*GraphLocator.randu());
	//	this(0,0);
	}

	public Coord(double x, double y)
	{
		super(x,y);
	}

	public Coord(double x, double y, boolean b)
	{
		this(x,y);
		m = b;
	}

	public void set(double x, double y, boolean b)
	{
		set(x,y);
		m = b;
	}

	public void set(double x, double y, boolean b, boolean c)
	{
		set(x,y);
		m = b;
		v = c;
	}

	public void setMoveable(boolean b)
	{
		m = b;
	}

	public void setVisible(boolean b)
	{
		v = b;
	}

	public void setHome(double x, double y)
	{
		x0 = x;
		y0 = y;
	}

	public void setHoming(boolean b)
	{
		h = b;
	}
}
