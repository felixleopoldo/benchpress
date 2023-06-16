package jpsgcs.alun.hashing;

import java.util.Map;

public class LinkedIdentityHashMap<K,V> extends AbstractLinkedHashMap<K,V>
{
	protected int hash(Object o)
	{
		return System.identityHashCode(o);
	}

	protected boolean myequals(Object a, Object b)
	{
		return a == b;
	}

	public LinkedIdentityHashMap(int init_cap, double init_load)
	{
		set(init_cap,init_load);
		clear();
	}

	public LinkedIdentityHashMap()
	{
		this(default_cap,default_load);
	}

	public LinkedIdentityHashMap(int init_cap)
	{
		this(init_cap,default_load);
	}
	
	public LinkedIdentityHashMap(Map<K,V> m)
	{
		this(3*m.size(),default_load);
		putAll(m);
	}

	public String toString()
	{
		StringBuffer b = new StringBuffer();
		for (K k : keySet())
			b.append(k+"\t"+get(k)+"\n");
		if (size() > 0)
			b.deleteCharAt(b.length()-1);
		return b.toString();
	}
}
