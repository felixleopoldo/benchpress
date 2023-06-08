package jpsgcs.alun.graph;

import jpsgcs.alun.hashing.LinkedIdentityHashMap;

import java.util.Set;
import java.util.Map;
import java.util.Collections;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.TreeMap;
import java.util.LinkedHashSet;
import java.util.Iterator;

/**
	This is a basic, but useful, implementation of a graph
	that allows only one connection between any pair of vertices.
	An object can, optionally, be associated with any edge, and
	the graph can contain either all directed, or all undirected
	edges.
*/

public class Network<V,E> extends GraphSkeleton<V,E> implements MutableGraph<V,E>
{
	// Implement GraphSkeleton abstract method.

	protected Map<V,E> makeMap()
	{
		if (identity)
			return new LinkedIdentityHashMap<V,E>();

		if (sorted)
			return new TreeMap<V,E>();

		return new LinkedHashMap<V,E>();
	}

	public Network(boolean directed, boolean identity, boolean sorted)
	{
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

	public Network()
	{
		this(false,false,false);
	}

	public Network(boolean directed)
	{
		this(directed,false,false);
	}

	public Network(boolean directed, boolean identity)
	{
		this(directed,identity,false);
	}

	public Network(int cap)
	{
		this.identity = false;
		this.sorted = false;
		f = new LinkedHashMap<V,Map<V,E>>(cap);
		b = f;
	}

//	Private data.

	private boolean identity = false;
	private boolean sorted = false;

// Extra methods 

	public boolean isIdentity()
	{
		return identity;
	}

	public V firstNeighbour(V x)
	{
		Set<V> n = outNeighbours(x);
		if (n == null)
			return null;
		Iterator<V> i = n.iterator();
		return i.hasNext() ? i.next() : null;
		//return outNeighbours(x).iterator().next();
	}

/*
	public void uniConnect(V x, V y)
	{
		if (!contains(x))
			add(x);
		for (V w : new LinkedHashSet<V>(outNeighbours(x)))
			disconnect(x,w);
		connect(x,y);
	}
	
	public V uniConnection(V x)
	{
		if (f.get(x) == null)
			return null;
		return f.get(x).keySet().iterator().next();
	}
*/

	public Map<V,E> neighbourMap(Object x)
	{
		return f.get(x);
	}
}
