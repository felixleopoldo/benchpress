package jpsgcs.alun.util;

public class IntArray
{
	public IntArray(int[] b)
	{
		a = new int[b.length];
		hash = 0;
		for (int i=0; i<a.length; i++)
		{
			a[i] = b[i];
			hash = hash + hash + a[i];
		}
	}

	public IntArray(IntArray b)
	{
		this(b.asArray());
	}

	public IntArray(int a)
	{
		this(toArray(a));
	}

	public IntArray(int a, int b)
	{
		this(toArray(a,b));
	}

	public IntArray(int a, int b, int c)
	{
		this(toArray(a,b,c));
	}

	public IntArray(int a, int b, int c, int d)
	{
		this(toArray(a,b,c,d));
	}

	public final int hashCode()
	{
		return hash;
	}

	public final int size()
	{
		return a.length;
	}

	public final int get(int i)
	{
		return a[i];
	}

	public String toString()
	{
		return toString(" ");
	}

	public String toString(String sep)
	{
		StringBuffer s = new StringBuffer();
		for (int i=0; i<a.length; i++)
		{
			s.append(a[i]);
			if (i < a.length -1 )
				s.append(sep);
		}
		return s.toString();
	}

	public final boolean equals(Object y)
	{
		if (!(y instanceof IntArray))
			return false;

		IntArray x = (IntArray) y;

		if (a.length != x.a.length)
			return false;

		for (int i=0; i<a.length; i++)
			if (a[i] != x.a[i])
				return false;
	
		return true;
	}

	public final int[] asArray()
	{
		return a;
	}

	public static int[] toArray(int a)
	{
		int[] x = {a};
		return x;
	}

	public static int[] toArray(int a, int b)
	{
		int[] x = {a, b};
		return x;
	}

	public static int[] toArray(int a, int b, int c)
	{
		int[] x = {a, b, c};
		return x;
	}

	public static int[] toArray(int a, int b, int c, int d)
	{
		int[] x = {a, b, c, d};
		return x;
	}

	private int[] a = null;
	private int hash = 0;
}
