package jpsgcs.alun.jtree;

import java.util.Random;

public class Separator<V> extends Clique<V>
{
/*
	public Separator(Clique<V> a, Clique<V> b)
	{
		this(a,b,-1);
	}

	public Separator(Clique<V> a, Clique<V> b, int ii)
	{
		super();
		x = a;
		y = b;

		for (V z : x)
			if (y.contains(z))
				add(z);
	}
*/
	public Separator(Clique<V> a, Clique<V> b, Random r)
	{
		super(r);
		x = a;
		y = b;

		for (V z : x)
			if (y.contains(z))
				add(z);
	}

	public Clique<V> getX()
	{
		return x;
	}

	public Clique<V> getY()
	{
		return y;
	}

	public void setX(Clique<V> xx)
	{
		x = xx;
	}

	public void setY(Clique<V> yy)
	{
		y = yy;
	}

	private Clique<V> x = null;
	private Clique<V> y = null;
}
