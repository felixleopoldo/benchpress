package jpsgcs.alun.util;

public class Point
{
	public double x = 0;
	public double y = 0;
	public double z = 0;

	private static double twoPI = 2*Math.PI;
	private static double toDeg = 360/2/Math.PI;

	public Point()
	{
	}

	public Point(double xx, double yy)
	{
		x = xx;
		y = yy;
	}

	public void set(double xx, double yy)
	{
		x = xx;
		y = yy;
	}

	public String toString()
	{
		return "("+x+","+y+")";
	}

	public final double r2()
	{
		return x*x + y*y;
	}

	public final double r()
	{
		return Math.sqrt(x*x+y*y);
	}

	public final double distanceTo(Point a)
	{
		return Math.sqrt( (a.x-x)*(a.x-x) + (a.y-y)*(a.y-y) );
	}

	public final double distance2To(Point a)
	{
		return (a.x-x)*(a.x-x) + (a.y-y)*(a.y-y);
	}

	public final double theta()
	{
		double theta = Math.atan2(y,x);
		if (theta < 0)
			theta += twoPI;
		return theta * toDeg;
	}

	public final double angleWith(Point a, Point b)
	{
		double theta = Math.atan2(a.y-y,a.x-x) - Math.atan2(b.y-y,b.x-x);
		if (theta < 0) 
			theta += twoPI;
		return theta * toDeg;
	}

	public double areaWith(Point a, Point b)
	{
		return (a.x-x) * (b.y-y) - (b.x-x) * (a.y-y);
	}

	public final boolean starboardOf(Point a, Point b)
	{
		return areaWith(a,b) < 0;
	}

	public final double volumeWith(Point a, Point b, Point c)
	{
		return  r2() * a.areaWith(b,c) - a.r2() * areaWith(b,c) - b.r2() * areaWith(c,a) - c.r2() * areaWith(a,b);
	}

	public final boolean outsideCircle(Point a, Point b, Point c)
	{
		return volumeWith(a,b,c) < 0;
	}

	public final double powerWith(Point a, Point b, Point c)
	{
		double s = a.areaWith(b,c);
		if (s > 0)
			return Double.NEGATIVE_INFINITY;
		else	
			return r2()  - ( a.r2() * areaWith(b,c) + b.r2() * areaWith(c,a) + c.r2() * areaWith(a,b)) / s;
	}
}
