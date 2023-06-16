package jpsgcs.alun.graph;

import jpsgcs.alun.markov.Parameter;
import java.util.Collection;

abstract public class GraphLocator<V,E>
{
	abstract public double move(LocatedGraph<V,E> g);

	public Parameter[] getParameters()
	{
		return par;
	}

	public void set(LocatedGraph<V,E> g)
	{
		double r = 100;
		double dr = 1.0;

		double n = g.getVertices().size();
		double t = 0;
		double dt =2* 2*Math.PI/n;

		for (Coord p : g.getCoords())
		{
			if (p.m)
			{
				p.x = randu()*1000 - 500 ;
				p.y = randu()*1000 - 500 ;

	//			r += dr;
	//			t += dt;
	//			p.x = r*Math.cos(t);
	//			p.y = r*Math.sin(t);
			}
		}
	}

// Private data and methods.

	protected Parameter[] par = null;
	
	// Don't want to use Math .random() and don't want
	// to bother with passing down a Random object,
	// and this will do to space out starting points
	// for vertices. Yeah RANDU!

	static private long seed = 1;

	static protected double randu()
	{
		seed = (seed * 65539) % 2147483648l;
		return  seed/2147483648.0;
	}
	
	protected double update(Coord a, Derivatives D)
	{
		double d2 = Math.abs(D.d2x + D.d2y);
		if (d2 > Double.MIN_VALUE)
		{
			a.x -= D.dx/d2;
			a.y -= D.dy/d2;
			return (D.dx*D.dx + D.dy*D.dy) /d2/d2 ;
		}
		return 0;
	}

	protected void addDerivatives(Derivatives D, Derivatives E, double s)
	{
		D.dx += s*E.dx;
		D.dy += s*E.dy;
		D.d2x += s*E.d2x;
		D.d2y += s*E.d2y;
	}

	protected Derivatives squaredAttractions(Coord a, Collection<Coord> c)
	{
		Derivatives D = new Derivatives();
		double x = 0;
		double y = 0;
		double r = 0;

		for (Coord b : c)
		{
			if (b == a)
				continue;
			x += b.x;
			y += b.y;
			r += 1;
		}

		D.dx += 2*r* a.x - 2*x;
		D.dy += 2*r* a.y - 2*y;
		D.d2x += 2*r;
		D.d2y += 2*r;
		return D;
	}

	protected Derivatives homeCoordAttraction(Coord a, double s)
	{
		Derivatives D = new Derivatives();
			
		D.dx += 2 * (a.x - s*a.x0);
		D.dy += 2 * (a.y - s*a.y0);
		D.d2x += 2;
		D.d2y += 2;
	
		return D;
	}

	protected Derivatives inverseSquareRepulsions(Coord a, Collection<Coord> c)
	{
		Derivatives D = new Derivatives();
		for (Coord b : c)
		{
			if (b == a)
				continue;

			double x = a.x - b.x;
			double xx = x*x;
			double y = a.y - b.y;
			double yy = y*y;

			double r = xx + yy;
			if (r < Double.MIN_VALUE)
				continue;

			r = 1.0/r;
			double s = -2*r*r;
			double t = 4*s*r;

			D.dx += s*x;
			D.dy += s*y;
			D.d2x += s - t*xx;
			D.d2y += s - t*yy;
		}
		return D;
	}

	protected Derivatives localRepulsions(Coord a, Collection<Coord> c, double gamma)
	{
		Derivatives D = new Derivatives();
		for (Coord b : c)
		{
			if (b == a)
				continue;

			double x = a.x - b.x;
			double xx = x*x;
			double y = a.y - b.y;
			double yy = y*y;

			double r = xx + yy;
			if (r < Double.MIN_VALUE)
				continue;

			if (r > gamma)
				continue;

			r = 1/r;

			double s = gamma * r;
			s = s*s;
			double t = 8*s*r;
			s = 2*(1-s);
			
			D.dx += s*x;
			D.dy += s*y;
			D.d2x += s + t*xx;
			D.d2y += s + t*yy;
		}
		return D;
	}

	protected Derivatives rootedLocalRepulsions(Coord a, Collection<Coord> c, double gamma)
	{
		Derivatives D = new Derivatives();
		for (Coord b : c)
		{
			if (b == a)
				continue;

			double x = a.x - b.x;
			double xx = x*x;
			double y = a.y - b.y;
			double yy = y*y;

			double r = xx + yy;
			if (r < Double.MIN_VALUE)
				continue;

			if (r > gamma)
				continue;

			double s = r - gamma;
			double t = 3*gamma -r;
			r = 1/Math.sqrt(r);
			s *= r*r*r;
			t *= r*r*r*r*r;

			D.dx += s*x;
			D.dy += s*y;
			D.d2x += s + t*xx;
			D.d2y += s + t*yy;
		}
		return D;
	}

	protected Derivatives verticalGenerations(Coord a, Collection<Coord> c, double delta)
	{
		Derivatives D = new Derivatives();

		for (Coord b : c)
		{
			if (b == a)
				continue;
			D.dy += a.y - b.y + delta;
			D.d2y += 1;
		}

		return D;
	}
}
