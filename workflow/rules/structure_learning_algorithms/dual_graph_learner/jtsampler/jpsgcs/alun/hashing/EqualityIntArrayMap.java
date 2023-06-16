package jpsgcs.alun.hashing;

import java.util.Map;

public class EqualityIntArrayMap<V> extends AbstractLinkedHashMap<int[],V>
{
	protected int hash(Object o)
	{
		if (o == null || !(o instanceof int[]))
			return 0;
		int[] x = (int[]) o;
		int y = 0;
		for (int i=0; i<x.length; i++)
			y = 2*y + x[i];
		return y;
	}

	protected boolean myequals(Object a, Object b)
	{
		if (a == null || !(a instanceof int[]))
			return false;
		if (b == null || !(b instanceof int[]))
			return false;

		int[] x = (int[]) a;
		int[] y = (int[]) b;

		if (x.length != y.length)
			return false;

		for (int i=0; i<x.length; i++)
			if (x[i] != y[i])
				return false;
		return true;
	}

	public EqualityIntArrayMap(int init_cap, double init_load)
	{
		set(init_cap,init_load);
		clear();
	}

	public EqualityIntArrayMap()
	{
		this(default_cap,default_load);
	}

	public EqualityIntArrayMap(int init_cap)
	{
		this(init_cap,default_load);
	}
	
	public EqualityIntArrayMap(Map<int[],V> m)
	{
		this(3*m.size(),default_load);
		putAll(m);
	}
}
