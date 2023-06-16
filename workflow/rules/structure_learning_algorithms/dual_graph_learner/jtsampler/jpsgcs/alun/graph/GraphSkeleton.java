package jpsgcs.alun.graph;

import java.util.Collections;
import java.util.Map;
import java.util.Collection;
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

public abstract class GraphSkeleton<V,E> 
{
	protected Map<V,Map<V,E>> f = null;
	protected Map<V,Map<V,E>> b = null;

	abstract protected Map<V,E> makeMap();

/*
	Graph functions.
*/
	public boolean contains(Object x)
	{
		return f.containsKey(x);
	}

	public boolean connects(Object x, Object y)
	{
		Map<V,E> n = f.get(x);
		return n == null ? false : n.containsKey(y) ;
	}

        public E connection(Object x, Object y)
        {
                Map<V,E> n = f.get(x);
                return n == null ? null : n.get(y);
        }

        public Collection<E> connections(Object x)
        {
                Map<V,E> n = f.get(x);
                return n == null ? null : Collections.unmodifiableCollection(n.values());
        }

	public Set<V> getVertices()
	{
		return Collections.unmodifiableSet(f.keySet());
	}

        public Set<V> getNeighbours(Object x)
        {
                if (b == f)
                        return outNeighbours(x);

                Set<V> n = new LinkedHashSet<V>();
		if (inNeighbours(x) != null)
                	n.addAll(inNeighbours(x));
		if (outNeighbours(x) != null)
                	n.addAll(outNeighbours(x));
                return n;
        }

        public boolean isDirected()
        {
                return f != b;
        }

	public Set<V> outNeighbours(Object x)
	{
		Map<V,E> n = f.get(x);
		return n == null ? null : Collections.unmodifiableSet(n.keySet());
	}

	public Set<V> inNeighbours(Object x)
	{
		Map<V,E> n = b.get(x);
		return n == null ? null : Collections.unmodifiableSet(n.keySet());
	}

/*
	Mutable graph functions.
*/

	public void clear()
	{
		f.clear();
		b.clear();
	}

	public void clearEdges()
	{
		for (Map<V,E> n : f.values())
			n.clear();
		for (Map<V,E> n : b.values())
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

	public boolean disconnect(Object x)
	{
		if (!contains(x))
			return false;

		for (V y : f.get(x).keySet())
			if (y != x)
				b.get(y).remove(x);
		f.get(x).clear();

		if (b != f)
		{
			for (V y : b.get(x).keySet())
				if (y != x)
					f.get(y).remove(x);
			b.get(x).clear();
		}

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

        public boolean connect(V x, V y)
        {
                if (connects(x,y))
                        return false;

                if (!contains(x))
                        add(x);
                if (!contains(y))
                        add(y);

                f.get(x).put(y,null);
                b.get(y).put(x,null);

                return true;
	}

        public boolean connect(V x, V y, E e)
        {
                if (connection(x,y) != null && connection(x,y) == e)
                        return false;

                if (!contains(x))
                        add(x);
                if (!contains(y))
                        add(y);

                f.get(x).put(y,e);
                b.get(y).put(x,e);

                return true;
        }

	public String toString()
	{
		StringBuffer s = new StringBuffer();

		for (V v : getVertices())
		{
			s.append(v+"\t");
			//for (V u : inNeighbours(v))
			for (V u : outNeighbours(v))
				s.append(u+" ");
			s.append("\n");
		}

		if (s.length() > 0)
			s.deleteCharAt(s.length()-1);

		return s.toString();
	}
}
