package jpsgcs.alun.graph;

import java.util.Collection;
import java.util.Collections;
import java.util.Set;
import java.util.Map;
import java.util.LinkedHashSet;
import java.util.LinkedHashMap;
import java.util.NoSuchElementException;
import java.util.ConcurrentModificationException;

public class LocatedMaskedGraph<V,E> implements MaskedGraph<V,E>, LocatedGraph<V,E>
{
	public LocatedMaskedGraph(Graph<V,E> graph)
	{
		g = graph;
		hide = new LinkedHashSet<V>();

		point = new LinkedHashMap<V,Coord>();
		for (V v : g.getVertices())
		{
			point.put(v, ( v instanceof Coord ? (Coord) v : new Coord() ) );
		}
	}

	public Collection<Coord> getShownCoords()
	{
		Set<Coord> s = new LinkedHashSet<Coord>();
		for (V v : getVertices())
			s.add(getCoord(v));
		return s;
	}

	public Collection<Coord> getComponentCoords(V v)
	{
		Set<Coord> s = new LinkedHashSet<Coord>();
		for (V u : Graphs.component(completeGraph(),v))
			s.add(getCoord(u));
		return s;
	}

	public Collection<Coord> getShownComponentCoords(V v)
	{
		Set<Coord> s = new LinkedHashSet<Coord>();
		for (V u : Graphs.component(this,v))
			s.add(getCoord(u));
		return s;
	}

// Located interface

	public V find(double x, double y)
	{
		V u = null;
		double dd = Double.MAX_VALUE;
		for (V v : getVertices())
		{
			Coord p = point.get(v);
			double d = (x-p.x)*(x-p.x) + (y-p.y)*(y-p.y);
			if (d < dd)
			{
				dd = d;
				u = v;
			}
		}
		return u;
	}

	public Coord getCoord(V v)
	{
		Coord d = point.get(v);
		if (d == null)
		{
			d = ( v instanceof Coord ? (Coord) v : new Coord() );
			point.put(v,d);
		}
		return d;
	}

	public Collection<Coord> getCoords(Collection<V> c)
	{
		Set<Coord> s = new LinkedHashSet<Coord>();
		if (c != null)
			for (V v : c)
				s.add(getCoord(v));
		return s;
	}

	public Collection<Coord> getCoords(V v)
	{
		Set<Coord> s = new LinkedHashSet<Coord>();
		s.add(getCoord(v));
		return s;
	}

	public Collection<Coord> getCoords()
	{
		return point.values();
	}

// Mask interface

	public void show(V x)
	{
		hide.remove(x);
	}

	public void hide(V x)
	{
		hide.add(x);
	}

	public void show(Collection<V> c)
	{
		for (V v : c)
			show(v);
	}

	public void hide(Collection<V> c)
	{
		for (V v : c)
			hide(v);
	}

	public Graph<V,E> completeGraph()
	{
		return g;
	}

// Graph interface

	public boolean contains(Object x)
	{
		return g.contains(x) && !hide.contains(x);
	}

	public boolean connects(Object x, Object y)
	{
		return !hide.contains(x) && !hide.contains(y) && g.connects(x,y);
	}

	public E connection(Object x, Object y)
	{
		return !hide.contains(x) && !hide.contains(y) ? g.connection(x,y) : null ;
	}	

	public Collection<E> connections(Object x)
	{
		return !hide.contains(x) ? g.connections(x) : null ;
	}

	public Collection<V> getVertices()
	{
		try
		{
			Set<V> v = new LinkedHashSet<V>(g.getVertices());
			v.removeAll(hide);
			return v;
		}
		catch (NoSuchElementException e)
		{
		//	System.err.println("Caught in LocatedMaskedGraph.getVertices()");
			return null;
		}
		catch (ConcurrentModificationException e)
		{
		//	System.err.println("Caught in LocatedMaskedGraph.getVertices()");
			return null;
		}
	}

	public Collection<V> getNeighbours(Object x)
	{
		try
		{
			Collection<V> n = new LinkedHashSet<V>();
			Collection<? extends V> h = g.getNeighbours(x);
			if (h != null)
			{
				for (V z : h)
					if (z != null)
						n.add(z);
				//n.addAll(h);
			}
			n.removeAll(hide);
			return n;
		}
		catch (ConcurrentModificationException e)
		{
		//	System.err.println("Caught in LocatedMaskedGraph.getNeighbours()");
			return null;
		}
	}

	public Collection<V> inNeighbours(Object x)
	{
		//Collection<V> n = new LinkedHashSet<V>(g.inNeighbours(x));
		Collection<V> n = new LinkedHashSet<V>();
		Collection<? extends V> h = g.inNeighbours(x);
		if (h != null)
			n.addAll(h);
		n.removeAll(hide);
		return n;
	}

	public Collection<V> outNeighbours(Object x)
	{
		//Collection<V> n = new LinkedHashSet<V>(g.outNeighbours(x));
		Collection<V> n = new LinkedHashSet<V>();
		Collection<? extends V> h = g.outNeighbours(x);
		if (h != null)
			n.addAll(h);
		n.removeAll(hide);
		return n;
	}

	public boolean isDirected()
	{
		return g.isDirected();
	}

// Private data
	
	private Graph<V,E> g = null;
	private Set<V> hide = null;
	private Map<V,Coord> point = null;
}
