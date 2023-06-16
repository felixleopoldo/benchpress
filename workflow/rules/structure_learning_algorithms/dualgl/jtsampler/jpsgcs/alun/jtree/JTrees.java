package jpsgcs.alun.jtree;

import jpsgcs.alun.graph.Graph;
import jpsgcs.alun.graph.Graphs;
import jpsgcs.alun.graph.Network;
import jpsgcs.alun.util.Pair;
import jpsgcs.alun.util.Monitor;
import jpsgcs.alun.util.IntValue;

import jpsgcs.alun.hashing.LinkedIdentityHashMap;

import java.util.Collections;
import java.util.Collection;
import java.util.ArrayList;
import java.util.List;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.LinkedHashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.LinkedList;
import java.util.Iterator;
import java.util.Random;

/**
	This is a class of static methods for manipulating graphs and junction trees.
*/
public class JTrees
{
	public static <V,E> List<Pair<V,V>> edgeRecomposition(Graph<V,E> g)
	{
		List<V> l = maximumCardinality(g);
		Set<V> p = new LinkedHashSet<V>(l);
		List<Pair<V,V>> result = new ArrayList<Pair<V,V>>();

		for (V v : l)
		{
			p.remove(v);
			Collection<V> s = new LinkedHashSet<V>(g.getNeighbours(v));
			s.retainAll(p);
			if (!Graphs.isClique(g,s))
				return null;
			
			for (V u : s)
				result.add(new Pair<V,V>(v,u));
		}

		Collections.reverse(result);

		return result;
	}

/**
	Returns true if the order of the vertices listed is a simple elimination
	scheme for the graph. 
*/
	public static <V,E> boolean isPerfectEliminationOrder(Graph<V,E> g, List<V> l)
	{
		Set<V> s = new LinkedHashSet<V>(l);

		if (l.size() != g.getVertices().size())
			return false;

		for (V v : l)
		{
			if (!g.contains(v))
				return false;
			s.remove(v);
			Set<V> n = new LinkedHashSet<V>(g.getNeighbours(v));
			n.retainAll(s);
			if (!Graphs.isClique(g,n))
				return false;
		} 
	
		return true;
	}

/**
	Returns true if the given graph is decomposable, aka chorded,
	aka triangulated.
*/
	public static <V,E> boolean isTriangulated(Graph<V,E> g)
	{
		return isPerfectEliminationOrder(g,maximumCardinality(g));
	}

/**
	Finds the links of the juction tree of a decomposable graph.
	If the graph is not decomposable, a null is returned.
*/
	public static <V,E> Map<Clique<V>,Clique<V>> cliques(Graph<V,E> g, Random r)
	{
		return cliques(g,g.getVertices(),r);
	}

	public static <V,E> Map<Clique<V>,Clique<V>> cliques(Graph<V,E> g, Collection<V> ord, Random r)
	{
		List<V> l = maximumCardinality(g,ord);
		Collections.reverse(l);

		Map<V,Clique<V>> map = new LinkedIdentityHashMap<V,Clique<V>>();

		Set<V> got = new LinkedHashSet<V>();
		Clique<V> root = null;
		Map<Clique<V>,Clique<V>> h = new LinkedIdentityHashMap<Clique<V>,Clique<V>>();
		
		for (V v : l)
		{
			Clique<V> C = new Clique<V>(g.getNeighbours(v),r);
			C.retainAll(got);

			if (!Graphs.isClique(g,C))
				return null;

			if (C.isEmpty())
			{
				C.add(v);
				h.put(C, root);
			}
			else
			{
				Clique<V> neib = null;

				for (V vv : C)
				{
					Clique<V> u = map.get(vv);
if (u == null)
	System.err.println("HERE");
					if (u.containsAll(C))
					{
						neib = u;
						break;
					}
				}

				if (neib == null)
				{
					System.err.println("Problem with finding cliques from elimination order");
					return null;
				}

				if (C.containsAll(neib))
				{
					neib.add(v);
					C = neib;
				}
				else
				{
					C.add(v);
					h.put(C,neib);
				}
			}

			map.put(v,C);
			got.add(v);
			root = C;
		}

		return h;
	}
	
/**
	Finds a maximum cardinality order for the vertices of the given graph.
*/
	public static <V,E> List<V> maximumCardinality(Graph<V,E> g)
	{
		return maximumCardinality(g,g.getVertices());
	}

	public static <V,E> List<V> maximumCardinality(Graph<V,E> g, Collection<V> ord)
	{
		if (g.getVertices().isEmpty())
			throw new RuntimeException("JTrees:maximumCardinality() supplied graph has no vertices.");

		if (!g.getVertices().equals(ord))
		{
			throw new RuntimeException("JTrees:maximumCardinality() order collection does not match graph vertices");
		}

		Map<V,IntValue> h = new LinkedHashMap<V,IntValue>();
		LinkedHashSet<V> s = new LinkedHashSet<V>();

		for (V v : ord)
		{
			h.put(v,new IntValue());
			s.add(v);
		}

		ArrayList<Set<V>> a = new ArrayList<Set<V>>();
		a.add(s);
		
		ArrayList<V> b = new ArrayList<V>();

		while (!a.isEmpty())
		{
			int i = a.size()-1;
			V v = a.get(i).iterator().next();
			b.add(v);

			a.get(i).remove(v);
			h.remove(v);

			for (int j=i; j>=0 && a.get(j).isEmpty(); j--)
				a.remove(j);

			for (V u : g.getNeighbours(v))
			{
				IntValue j = h.get(u);
			
				if (j == null)
					continue;
				
				a.get(j.value()).remove(u);

				j.add(1);
				if (j.value() == a.size())
					a.add(new LinkedHashSet<V>());

				a.get(j.value()).add(u);
			}
		}

		Collections.reverse(b);
		return b;
	}

/**
	Inefficient, but simple, direct implementation of lex BFS from Wikipedia.
	Not any better than max cardinality since it doesn't provide a minimal
	triangulation of non-decomposable graphs.
	Just left it here for reference.
*/

	public static <V,E> List<V> lexBFS(Graph<V,E> g)
	{
		if (g.getVertices().isEmpty())
			throw new RuntimeException("JTrees:lexBFS() supplied graph has no vertices.");

		ArrayList<Set<V>> a = new ArrayList<Set<V>>();
		a.add(new LinkedHashSet<V>(g.getVertices()));

		ArrayList<V> b = new ArrayList<V>();

		while (!a.isEmpty())
		{
			V v = a.get(0).iterator().next();
			b.add(v);
			a.get(0).remove(v);

			for (int i=a.size()-1; i>=0; i--)
			{
				Set<V> x = new LinkedHashSet<V>();
				x.addAll(g.getNeighbours(v));
				x.retainAll(a.get(i));

				a.add(i,new LinkedHashSet<V>());
				
				a.get(i).addAll(x);
				a.get(i+1).removeAll(x);
			}

			for (int i=a.size()-1; i>=0; i--)
				if (a.get(i).isEmpty())
					a.remove(i);
		}

		Collections.reverse(b);
		return b;
	}

	
/**
	 Finds the prime subgraphs of an arbitrary undirected graph.
*/
	public static <V,E> Map<Clique<V>,Clique<V>> primes(Graph<V,E> g, Random r)
	{
		Network<V,E> fill = new Network<V,E>();
		for (V x : g.getVertices())
		{
			fill.add(x);
			for (V y : g.getNeighbours(x))
				fill.connect(x,y);
		}

		List<V> l = maxCardMinimal(g,fill);
		Collections.reverse(l);

		Map<V,Clique<V>> map = new LinkedIdentityHashMap<V,Clique<V>>();

		Set<V> got = new LinkedHashSet<V>();
		Clique<V> root = null;
		Map<Clique<V>,Clique<V>> h = new LinkedIdentityHashMap<Clique<V>,Clique<V>>();
		
		for (V v : l)
		{
			Clique<V> C = new Clique<V>(fill.getNeighbours(v),r);
			C.retainAll(got);

			if (C.isEmpty())
			{
				C.add(v);
				h.put(C, root);
			}
			else
			{
				Clique<V> neib = null;

				for (V vv : C)
					if (map.get(vv).containsAll(C))
					{
						neib = map.get(vv);
						break;
					}

				if (neib == null)
				{
					System.err.println("Problem with finding cliques from elimination order");
					return null;
				}

				if (!Graphs.isClique(g,C) || C.containsAll(neib))
				{
					neib.add(v);
					C = neib;
				}
				else
				{
					C.add(v);
					h.put(C,neib);
				}
			}

			map.put(v,C);
			got.add(v);
			root = C;
		}

		return h;
	}

/**
	True if a path of the type defined by Berry et al 2004 exists.
	Used by maxCardMinimal().
*/
	private static <V,E> boolean isPath(V x, V y, Graph<V,E> g, Map<V,IntValue> m, int lim)
	{
		LinkedList<V> l = new LinkedList<V>();
		l.add(x);
		Set<V> got = new LinkedHashSet<V>();
		got.add(x);
		
		while (!l.isEmpty())
		{
			V v = l.pop();
			for (V u : g.getNeighbours(v))
			{
				if (u == y)
					return true;
				if (m.get(u) != null && m.get(u).value() < lim && !got.contains(u))
				{
					l.add(u);
					got.add(u);
				}
			}
		}

		return false;
	}


	private static<V,E> Set<V> getMarked(V v, Graph<V,E> g, int thresh, Map<V,IntValue> map)
	{
		Set<V> marked = new LinkedHashSet<V>();
		LinkedList<V> list = new LinkedList<V>();
		Set<V> got = new LinkedHashSet<V>();
		Set<V> boundary = new LinkedHashSet<V>();

		list.add(v);
		got.add(v);

		for (int cut = 0; cut <= thresh; cut++)
		{
			for (V x : boundary)
				if (map.get(x).value() < cut)
				{
					list.add(x);
					got.add(x);
				}
			boundary.removeAll(got);

			while (!list.isEmpty())
			{
				V x = list.pop();

				for (V y : g.getNeighbours(x))
				{
					if (map.get(y) == null || got.contains(y))
						continue;

					if (map.get(y).value() < cut)
					{
						list.add(y);
						got.add(y);
					}
					else
					{
						marked.add(y);
						boundary.add(y);
					}
				}
			}
		}

		return marked;
	}



/**
	Modified maximum cardinality search that ensure the ordering induces
	a minimal fill in for the graph g. The graph f is the filled-in decomposable
	graph defined by the numbering.
	This is the MCS-M algorithm of Berry, Blair and Heggernes, "Maximum
	Cardinality Search for Computing Minimal Triangulations of Graphs",
	Algorithmica, 2004.
*/
	public static <V,E> List<V> maxCardMinimal(Graph<V,E> g, Network<V,E> f)
	{
		Map<V,IntValue> map = new LinkedHashMap<V,IntValue>();
		for (V v : g.getVertices())
			map.put(v,new IntValue());

		ArrayList<Set<V>> a = new ArrayList<Set<V>>();
		a.add(new LinkedHashSet<V>(g.getVertices()));
		
		ArrayList<V> result = new ArrayList<V>();

		while (!a.isEmpty())
		{
			int i = a.size()-1;
			V v = a.get(i).iterator().next();
			a.get(i).remove(v);
			for (int j=a.size()-1; j>=0 && a.get(j).isEmpty(); j--)
				a.remove(j);
			
			map.remove(v);

			for (V u : getMarked(v,g,a.size()-1,map))
			{
				f.connect(v,u);

				IntValue j = map.get(u);
				a.get(j.value()).remove(u);
				j.add(1);
				if (j.value() == a.size())
					a.add(new LinkedHashSet<V>());
				a.get(j.value()).add(u);
			}

			result.add(v);
		}

		Collections.reverse(result);
		return result;
	}
}
