package jpsgcs.alun.graph;

import java.util.Collections;
import java.util.Map;
import java.util.Set;
import java.util.LinkedHashSet;

/*
        This is a flexible and reasonably efficient skeleton data structure 
	for implementing graphs.
        Derived classes can extend this to make directed or undirected graphs,
        to allow multiple connections between vertices or not, and
        to allow association of objects with edges or not.

        It is essentially a list of adjacencies implemented as a mapping
        of the two vertices to an object associated with the ordered/unordered pair.
        There is a mapping for forward edges and one for reverse edges, allowing
        for directed graphs. For undirected graphs a single mapping is
        used.
*/

public abstract class GraphSkeleton<V,T> 
{
	protected Map<V,Map<V,T>> f = null;
	protected Map<V,Map<V,T>> b = null;

	abstract protected Map<V,T> makeMap();

	public boolean contains(Object x)
	{
		return f.containsKey(x);
	}

	public boolean connects(Object x, Object y)
	{
		Map<V,T> n = f.get(x);
		return n == null ? false : n.containsKey(y) ;
	}

	public Set<V> getVertices()
	{
		return Collections.unmodifiableSet(f.keySet());
	}

	public Set<V> outNeighbours(Object x)
	{
		Map<V,T> n = f.get(x);
		return n == null ? null : Collections.unmodifiableSet(n.keySet());
	}

	public Set<V> inNeighbours(Object x)
	{
		Map<V,T> n = b.get(x);
		return n == null ? null : Collections.unmodifiableSet(n.keySet());
	}

	public void clear()
	{
		f.clear();
		b.clear();
	}

	public void clearEdges()
	{
		for (Map<V,T> n : f.values())
			n.clear();
		for (Map<V,T> n : b.values())
			n.clear();
	}

	public boolean add(V x)
	{
		if (f.containsKey(x))
			return false;

		f.put(x,makeMap());
		if (b != f)
			b.put(x,makeMap());

		return true;
	}

	public boolean disconnect(Object x, Object y)
	{
		if (!contains(x) || !contains(y) || !connects(x,y))
			return false;

		f.get(x).remove(y);
		b.get(y).remove(x);

		return true;
	}

	public boolean remove(Object x)
	{
		if (!contains(x))
			return false;

		for (V y : f.get(x).keySet())
			if (y != x)
				b.get(y).remove(x);
		f.remove(x);

		if (b != f)
		{
			for (V y : b.get(x).keySet())
				if (y != x)
					f.get(y).remove(x);
			b.remove(x);
		}

		return true;
	}

	public String toString()
	{
		StringBuffer s = new StringBuffer();

		for (V v : getVertices())
		{
			s.append(v+"\t");
			for (V u : inNeighbours(v))
			//for (V u : outNeighbours(v))
				s.append(u+" ");
			s.append("\n");
		}

		if (s.length() > 0)
			s.deleteCharAt(s.length()-1);

		return s.toString();
	}
}
