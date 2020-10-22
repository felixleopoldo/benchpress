package jpsgcs.alun.hashing;

import java.util.Collection;
import java.util.Set;
import java.util.Map;
import java.util.Iterator;
import java.util.Random;
import jpsgcs.alun.util.RandomBag;

public class RandomSet<E> implements Set<E>, RandomBag<E> 
{
	public static boolean wantReproducibleRandoms = true;

	public RandomSet(Random r)
	{
		rand = r;
		map = new LinkedEqualityHashMap<E,E>();
	} 

	public RandomSet(Collection<? extends E> c, Random r)
	{
		this(r);
		addAll(c);
	} 

// Random bag interface.

	public E next()
	{
		//Map.Entry<E,E> x = map.randomLinkedEntry(rand);
		//Map.Entry<E,E> x = map.randomHashedEntry(rand);
		Map.Entry<E,E> x = wantReproducibleRandoms ? map.randomLinkedEntry(rand) :  map.randomHashedEntry(rand);
		return x == null ? null : x.getKey();
	}

	public E draw()
	{
		E x = next();
		remove(x);
		return x;
	}

	public boolean add(E e)
	{
		if (map.containsKey(e))
			return false;
		else
		{
			map.put(e,null);
			return true;
		}
	}

	public boolean addAll(Collection<? extends E> c)
	{
		boolean changed = false;
		for (E e : c)
			changed = add(e) || changed;
		return changed;
	}

	public void clear()
	{
		map.clear();
	}

	public boolean contains(Object o)
	{
		return map.containsKey(o);
	}

	public boolean containsAll(Collection<?> c)
	{
		for (Object o : c)
			if (!contains(o))
				return false;
		return true;
	}

	public boolean equals(Object o)
	{
		if (!(o instanceof Set))
			return false;
		Set s = (Set)o;
		return containsAll(s) && s.containsAll(this);
	}

	public int hashCode()
	{
		int hash = 0;
		for (E e : map.keySet())
			hash += map.hash(e);
		return hash;
	}

	public boolean isEmpty()
	{
		return map.isEmpty();
	}

	public  Iterator<E> iterator()
	{
		return map.keySet().iterator();
	}

	public boolean remove(Object o)
	{
		if (map.containsKey(o))
		{
			map.remove(o);
			return true;
		}
		else
		{
			return false;
		}
	}

	public boolean removeAll(Collection<?> c)
	{
		boolean changed = false;
		for (Object o : c)
			changed = remove(o) || changed;
		return changed;
	}

	public boolean retainAll(Collection<?> c)
	{
		boolean changed = false;
		
		Iterator<Map.Entry<E,E>> it = map.entrySet().iterator();

		while (it.hasNext())
		{
			E e = it.next().getKey();
			if (!c.contains(e))
			{
				changed = true;
				it.remove();
			}
		}
		
		return changed;
	}

	public int size()
	{
		return map.size();
	}

	public Object[] toArray()
	{
		Object[] x = new Object[map.keySet().size()];
		Iterator<E> it = map.keySet().iterator();
		for (int i=0; i<x.length; i++)
			x[i] = it.next();
		return x;
	}

	public <T> T[] toArray(T[] a)
	{
		int s = map.keySet().size();

		T[] x = ( s <= a.length ? a : (T[]) new Object[s] );
		if (s < x.length)
			x[s] = null;
		
		Iterator<E> it = map.keySet().iterator();
		for (int i=0; i<s; i++)
			x[i] = (T) it.next();

		return x;
	}

// Private data and methods.

	protected AbstractLinkedHashMap<E,E> map = null;
	protected Random rand = null;
}
