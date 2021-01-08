package jpsgcs.alun.util;

import java.util.Collection;
import java.util.LinkedHashSet;

public class RadixPlaneSorter<E extends Point>
{
	public RadixPlaneSorter(double x, double y, int k)
	{
		l = new Lattice<Collection<E>>(k);
		xgap = x;
		ygap = y;
	}

	public void add(E m)
	{
		tile(m.x,m.y).add(m);
	}

	public void remove(E m)
	{
		tile(m.x,m.y).remove(m);
	}

	public Collection<E> getLocal(E a, double r)
	{
		double rr = r*r;
		int xl = (int)( (a.x-r)/xgap );
		int xh = (int)( (a.x+r)/xgap );
		int yl = (int)( (a.y-r)/ygap );
		int yh = (int)( (a.y+r)/ygap );

		Collection<E> s = null;
		Collection<E> v = new LinkedHashSet<E>();

//System.err.println(xl+" "+xh+" "+yl+" "+yh);

		for (int i=xl; i<=xh; i++)
			for (int j=yl; j<=yh; j++)
			{
				s = l.get(i,j);
				if (s != null)
				{
					for (E m : s)
					{
						double xx = m.x - a.x;
						xx = xx*xx;
						double yy = m.y - a.y;
						yy = yy*yy;
						if (xx+yy < rr)
							v.add(m);
					}
				}
			}

		v.remove(a);

		return v;
	}

// Private data.

	private Lattice<Collection<E>> l = null;
	private double xgap = 0;
	private double ygap = 0;

	private Collection<E> tile(double a, double b)
	{
		int i = (int)(a/xgap);
		int j = (int)(b/ygap);
		Collection<E> s = l.get(i,j);
		if (s == null)
		{
			s = new LinkedHashSet<E>();
			l.put(i,j,s);
		}
		return s;
	}
}
