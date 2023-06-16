package jpsgcs.alun.hashing;

import java.util.Collection;
import java.util.Random;

public class RandomIdentitySet<E> extends RandomSet<E>
{
	public RandomIdentitySet(Collection<? extends E> c, Random r)
	{
		super(r);
		map = new LinkedIdentityHashMap<E,E>();
		if (c != null)
			addAll(c);
	} 

	public RandomIdentitySet(Random r)
	{
		this(null,r);
	} 

	public RandomIdentitySet()
	{
		this(null,null);
	}

	public RandomIdentitySet(Collection<? extends E> c)
	{
		this (c,null);
	}

	public RandomIdentitySet(E c)
	{
		this (null,null);
		add(c);
	}

	public String toString()
	{
		StringBuffer b = new StringBuffer();
		b.append("[");
		for (E e : this)
			b.append(e+",");
		if (!isEmpty())
			b.deleteCharAt(b.length()-1);
		b.append("]");
		return b.toString();
	}
}
