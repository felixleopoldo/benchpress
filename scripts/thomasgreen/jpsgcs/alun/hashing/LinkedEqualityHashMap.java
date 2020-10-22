package jpsgcs.alun.hashing;

import java.util.Map;

public class LinkedEqualityHashMap<K,V> extends AbstractLinkedHashMap<K,V>
{
	protected int hash(Object o)
	{
		return o == null ? 0 : o.hashCode();
	}

	protected boolean myequals(Object a, Object b)
	{
		return a == null ? b == null : a.equals(b);
	}

	public LinkedEqualityHashMap(int init_cap, double init_load)
	{
		set(init_cap,init_load);
		clear();
	}

	public LinkedEqualityHashMap()
	{
		this(default_cap,default_load);
	}

	public LinkedEqualityHashMap(int init_cap)
	{
		this(init_cap,default_load);
	}
	
	public LinkedEqualityHashMap(Map<K,V> m)
	{
		this(3*m.size(),default_load);
		putAll(m);
	}
}
