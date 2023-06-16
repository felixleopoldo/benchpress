package jpsgcs.alun.util;

public class StringFormatter
{
	public static String format(int x, int s)
	{
		return format(x,s,' ');
	}

	public static String format(String s, int x)
	{
		StringBuffer b = new StringBuffer();
		for (int i=x; i>s.length(); i--)
			b.append(" ");
		b.append(s);
		return b.toString();
	}

	public static String format(double x, int b)
	{
		return format(x,-1,b);
	}

// Private methods

	private static String space(int x, int n, char c)
	{
		StringBuffer f = new StringBuffer();
		int y = x;
		if (y < 0)
			y = -y;
		int m = 1;
		while (y >= 10)
		{
			m++;
			y /= 10;
		}

		for (int i=m; i<n; i++)
			f.append(c);
		return f.toString();
	}

	private static String format(int x, int n, char c)
	{
		StringBuffer f = new StringBuffer();
		
		if (x>=0)
		{
			f.append(space(x,n,c));
			f.append(x);
		}
		else
		{
			f.append(space(x,n-1,c));
			f.append("-");
			f.append(Math.abs(x));
		}

		return f.toString();
	}

	public static String format(double x, int a, int b)
	{
		StringBuffer f = new StringBuffer();

		if (x == Double.POSITIVE_INFINITY)
			return " +Infinity";
		if (x == Double.NEGATIVE_INFINITY)
			return " -Infinity";

		if (x >= 0)
		{
			f.append(space((int)x,a,' '));
			f.append((int)x);
		}
		else
		{
			f.append(space(Math.abs((int)x),a-1,' '));
			f.append('-');
			f.append(Math.abs(((int)x)));
		}

		if (b > 0)
		{
			f.append('.');
			double r = Math.abs(x -(int)x);
			for (int i=0; i<b; i++)
				r *= 10;
			f.append(format((int)r,b,'0'));
		}

		return f.toString();
	}
}
