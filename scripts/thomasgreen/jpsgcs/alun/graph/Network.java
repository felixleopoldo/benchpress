package jpsgcs.alun.graph;

import jpsgcs.alun.hashing.LinkedIdentityHashMap;

import java.util.Set;
import java.util.Map;
import java.util.Collections;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.TreeMap;
import java.util.LinkedHashSet;

/**
	This is a basic, but useful, implementation of a graph
	that allows only one connection between any pair of vertices.
	An object can, optionally, be associated with any edge, and
	the graph can contain either all directed, or all undirected
	edges.
*/

public class Network<V,E> extends GraphSkeleton<V,E> implements MutableGraph<V,E>
{
/**
 Creates an empty undirected Network.
*/
	public Network()
	{
		this(false,false,false);
	}

/**
 Creates a new directed or undirected Network as specified by the given boolean.
*/
	public Network(boolean directed)
	{
		this(directed,false,false);
	}

	public Network(boolean directed, boolean identity)
	{
		this(directed,identity,false);
	}

	public Network(boolean directed, boolean identity, boolean sorted)
	{
		this.directed = directed;
		this.identity = identity;
		this.sorted = sorted;

		if (identity)
		{
			f = new LinkedIdentityHashMap<V,Map<V,E>>();
			b = ( directed ? new LinkedIdentityHashMap<V,Map<V,E>>() : f );
		}
		else if (sorted)
		{
			f = new TreeMap<V,Map<V,E>>();
			b = ( directed ? new TreeMap<V,Map<V,E>>() : f );
		}
		else
		{
			f = new LinkedHashMap<V,Map<V,E>>();
			b = ( directed ? new LinkedHashMap<V,Map<V,E>>() : f );
		}
	}

	public Network(int cap)
	{
		this.directed = false; 
		this.identity = false;
		this.sorted = false;

		f = new LinkedHashMap<V,Map<V,E>>(cap);
		b = ( directed ? new LinkedHashMap<V,Map<V,E>>(cap) : f );
	}

	public boolean isDirected()
	{
		return directed;
	}

	public boolean isIdentity()
	{
		return identity;
	}

	public Set<V> getNeighbours(Object x)
	{
		if (b == f)
			return outNeighbours(x);
		
		Set<V> n = new LinkedHashSet<V>();
		n.addAll(inNeighbours(x));
		n.addAll(outNeighbours(x));
		return n;
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

	public Map<V,E> neighbourMap(Object x)
	{
		return f.get(x);
	}

//	Private data and methods.

	private boolean directed = false;
	private boolean identity = false;
	private boolean sorted = false;

	protected Map<V,E> makeMap()
	{
		if (identity)
			return new LinkedIdentityHashMap<V,E>();

		if (sorted)
			return new TreeMap<V,E>();

		return new LinkedHashMap<V,E>();
	}
}
