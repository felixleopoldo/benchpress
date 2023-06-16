package jpsgcs.alun.util;

public class Main
{
	public static String[] strip(String[] a, String s)
	{
		if (a != null)
		{
			for (int i=0; i<a.length; i++)
			{
				if (a[i].equals(s))
				{
					String[] b = new String[a.length-1];
					for (int j=0; j<i; j++)
						b[j] = a[j];
					for (int j=i+1; j<a.length; j++)
						b[j-1] = a[j];
						return b;
				}
			}
		}
		return a;
	}

	public static boolean gotOpt(String[] a, String x)
	{
		for (String y : a)
			if (y.equals(x))
				return true;
		return false;
	}

	public static String stringAfter(String[] a, String x)
	{
		for (int i=0; i<a.length; i++)
			if (a[i].equals(x))
				return a[i+1];
		return null;
	}

	public static int intAfter(String[] a, String x)
	{
		for (int i=0; i<a.length; i++)
			if (a[i].equals(x))
				return new Integer(a[i+1]).intValue();
		return 0;
	}

	public static double doubleAfter(String[] a, String x)
	{
		for (int i=0; i<a.length; i++)
			if (a[i].equals(x))
				return new Double(a[i+1]).doubleValue();
		return 0;
	}

	public static String stringAfter(String[] a, String x, String defval)
	{
		for (int i=0; i<a.length; i++)
			if (a[i].equals(x))
				return a[i+1];
		return defval;
	}

	public static int intAfter(String[] a, String x, int defval)
	{
		for (int i=0; i<a.length; i++)
			if (a[i].equals(x))
				return new Integer(a[i+1]).intValue();
		return defval;
	}

	public static double doubleAfter(String[] a, String x, double defval)
	{
		for (int i=0; i<a.length; i++)
			if (a[i].equals(x))
				return new Double(a[i+1]).doubleValue();
		return defval;
	}
}
