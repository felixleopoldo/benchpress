package jpsgcs.alun.graph;

import jpsgcs.alun.jtree.Clique;
import jpsgcs.alun.jtree.JTrees;
import jpsgcs.alun.util.Pair;

import java.util.Random;
import java.util.Set;
import java.util.Map;
import java.util.PriorityQueue;
import java.util.List;
import java.util.List;
import java.util.LinkedHashMap;
import java.util.Collection;
import java.util.LinkedHashSet;
import java.util.ArrayList;
import java.util.StringTokenizer;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
	A class containing static methods for basic graph manipulations. 
	Analagous to the the Collections class that manipulates a Collection.
*/

public class Graphs
{
	static public <V,E> Set<Set<V>> getCliques(Graph<V,E> g)
	{
		return getCliques(g,0,50,g.getVertices().size()+1);
	}

	static public <V,E> Set<Set<V>> getCliques(Graph<V,E> g, int max)
	{
		return getCliques(g,0,50,max);
	}
	
	static public <V,E> Set<Set<V>> getCliques(Graph<V,E> g, int opt, int redo)
	{
		return getCliques(g,opt,redo,g.getVertices().size()+1);
	}

	static public <V,E> Set<Set<V>> getCliques(Graph<V,E> g, int opt, int redo, int max)
	{
		if (JTrees.isTriangulated(g))
		{
			return triangulatedcliques(g,max);
		}

		Network<V,E> h = new Network<V,E>();
		for (V x : g.getVertices())
		{
			h.add(x);
			for (V y : g.getNeighbours(x))
				h.connect(x,y);
		}

		triangulate(h);

		PriorityQueue<Set<V>> queue = new PriorityQueue<Set<V>>(11,new BiggestSet());

		Set<Set<V>> tcliques = triangulatedcliques(h,max);

		for (Set<V> c : tcliques)
		{
			Network<V,E> k = new Network<V,E>();
			for (V x : c)
			{
				k.add(x);
				for (V y : c)
					if (x != y && g.connects(x,y))
						k.connect(x,y);
			}

			if (JTrees.isTriangulated(k))
			{
				queue.addAll(triangulatedcliques(k,max));
			}
			else
			{
				if (k.getVertices().size() > 10 && opt < redo)
				{
					queue.addAll(getCliques(k,opt+1,redo));
				}
				else
				{
					queue.addAll(bruteforcecliques(k,max));
				}
			}
		}

		Set<Set<V>> output = new LinkedHashSet<Set<V>>();
		while (!queue.isEmpty())
		{
			Set<V> x = queue.poll();
			boolean ok = true;
			for (Set<V> y : output)
				if (y.containsAll(x))
				{
					ok = false;
					break;
				}
			if (ok)
				output.add(x);
		}

		return output;
	}

	static public <V,E> Set<Set<V>> triangulatedcliques(Graph<V,E> g, int max)
	{
		Set<Set<V>> res = new LinkedHashSet<Set<V>>();
		for (Set<V> c : triangulatedcliques(g))
			if (c.size() <= max)
				res.add(c);
		return res;
	}

	static public <V,E> Set<Set<V>> triangulatedcliques(Graph<V,E> g)
	{
		DecomposableGraphJT<V,E> d = new DecomposableGraphJT<V,E>();
		for (V x : g.getVertices())
			d.add(x);
		List<Pair<V,V>> e = JTrees.edgeRecomposition(g);
		if (e == null)
			System.err.println("Not decomposable");
		for (Pair<V,V> p : e)
			if (!d.connect(p.x,p.y))
				System.err.println("Can't connect\t"+p.x+"\t"+p.y);
		return d.getCliques();
	}

	static public <V,E> Set<Set<V>> bruteforcecliques(Graph<V,E> g)
	{
		return bruteforcecliques(g,g.getVertices().size()+1);
	}

	static public <V,E> Set<Set<V>> bruteforcecliques(Graph<V,E> g, int max)
	{
		Set<Set<V>> C = new LinkedHashSet<Set<V>>();

		V[] v = (V[]) g.getVertices().toArray();

		if (v.length == 0)
			return C;

		int[] u = new int[v.length];
		for (int i=0; i<u.length; i++)
			u[i] = 2;

		Set<V>[] x = (Set<V>[]) new Set[u.length+1];
		for (int i=0; i<x.length; i++)
			x[i] = new LinkedHashSet<V>();

		for (int i=0; i>=0; )
		{
			if (u[i]-- == 0)
			{
				u[i] = 2;
				i--;
			}
			else
			{
				x[i+1].clear();
				x[i+1].addAll(x[i]);

				if (u[i] == 1)
				{
					boolean ok = true;
					for (V vv : x[i])
					{
						if (!g.connects(vv,v[i]))
						{
							ok = false;
							break;
						}
					}
	
					if (!ok)
						continue;
	
					x[i+1].add(v[i]);
				}

				if (x[i+1].size() > max)
					continue;

				if (++i == u.length)
				{
					boolean ok = true;
					for (Set<V> c : C)
					{
						if (c.containsAll(x[i]))
						{
							ok = false;
							break;
						}
					}

					if (ok)
						C.add(new LinkedHashSet<V>(x[i]));

					i--;
				}
			}
		}

		return C;
	}

	static public Network<Integer,Object> integerGraph(int n)
	{
		Network<Integer,Object> g = new Network<Integer,Object>();
		for (int i=0; i<n; i++)
			g.add(new Integer(i));
		return g;
	}

	static public <V,E> boolean equal(Graph<V,E> g, Graph<V,E> h)
	{
		if (g.isDirected() != h.isDirected())
			return false;
		
		if (!g.getVertices().equals(h.getVertices()))
			return false;

		for (V v : g.getVertices())
		{
			if (g.isDirected())
			{
				if (!g.inNeighbours(v).equals(h.inNeighbours(v)))
					return false;
				if (!g.outNeighbours(v).equals(h.outNeighbours(v)))
					return false;
			}
			else
			{
				if (!g.getNeighbours(v).equals(h.getNeighbours(v)))
					return false;
			}
		}

		return true;
	}

	static public <V,E> int countEdges(Graph<V,E> g)
	{
		int a = 0;
		int b = 0;
		for (V v : g.getVertices())
		{
			Collection<V> n = g.getNeighbours(v);
			a += n.size();
			if (n.contains(v))
				b++;
		}

		return (a+b)/2;
	}

	static public <V,E> List<V> triangulate(MutableGraph<V,E> g)
	{
		Set<V> peel = new LinkedHashSet<V>(g.getVertices());
		return triangulate(g,peel);
	}

/**
 	Triangulates a graph using greedy algorithm for minimum fill ins.
*/
	static public <V,E> List<V> triangulateTo(MutableGraph<V,E> g, Collection<V> keep)
	{
		Set<V> peel = new LinkedHashSet<V>(g.getVertices());
		peel.removeAll(keep);
		return triangulate(g,peel);
	}

	static public <V,E> List<V> triangulate(MutableGraph<V,E> g, Collection<V> p)
	{
		Collection<V> peel = new LinkedHashSet<V>(p);
		List<V> sequence = new ArrayList<V>();

		Network<V,E> h = new Network<V,E>();
		for (V v : g.getVertices())
		{
			h.add(v);
			for (V u : g.getNeighbours(v))
				h.connect(u,v);
		}

		
		while (!peel.isEmpty())
		{
			V v = null;
			double best = Double.MAX_VALUE;
			
			for (V u : peel)
			{
				double c = cost(h,u);
				if (c == 0)
				{
					v = u;
					break;
				}
				if (c < best)
				{
					v = u;
					best = c;
				}
			}

			for (V u : h.getNeighbours(v))
				if (u != v)
					for (V w : h.getNeighbours(v))
						if (w != v)
							if (u != w && !h.connects(u,w))
							{
								h.connect(u,w);
								g.connect(u,w);
							}
	
			h.remove(v);
			peel.remove(v);
			sequence.add(v);
		}

		return sequence;
	}

	static private <V,E> double cost(Graph<V,E> g, V v)
	{
		V[] n = (V[]) g.getNeighbours(v).toArray(new Object[0]);
		double count = 0;
		for (int i=0; i<n.length; i++)
			for (int j=i+1; j<n.length; j++)
				if (!g.connects(n[i],n[j]))
					count += 1;
		return count;
	}
	
/** 
	Returns the set of vertices in the same sub component of g that contains v.
*/
	static public <V,E> Set<V> component(Graph<V,E> g, V v)
	{
		if (!g.contains(v))
			return null;

		ArrayList<V> a = new ArrayList<V>();
		Set<V> s = new LinkedHashSet<V>();
		s.add(v);
		a.add(v);

		for (int i=0; i<a.size(); i++)
			for (V u : g.getNeighbours(a.get(i)))
				if (!s.contains(u))
				{
					s.add(u);
					a.add(u);
				}
		
		return s;
	}

	static public <V,E> Set<Set<V>> components(Graph<V,E> g)
	{
		Set<V> s = new LinkedHashSet<V>(g.getVertices());
		Set<Set<V>> c = new LinkedHashSet<Set<V>>();

		while (!s.isEmpty())
		{
			V v = s.iterator().next();
			Set<V> comp = component(g,v);
			c.add(comp);
			s.removeAll(comp);
		}

		return c;
	}

/**
	Returns true if all pairs of verticies in x are connected in g.
	Takes twice as much time as necessary for undirected graphs 
	because pairs are checked in both orientations.
*/
	static public <V,E> boolean isClique(Graph<V,E> g, Collection<V> x)
	{
		for (V u : x)
			for (V v : x)
				if (u != v && !g.connects(u,v))
					return false;
		return true;
	}

/**
	Reads a graph from standard input.
*/
	static public Network<String,Object> read() throws IOException
	{
		return read(new BufferedReader(new InputStreamReader(System.in)));
	}
	
	static public Network<String,Object> read(boolean directed) throws IOException
	{
		return read(new BufferedReader(new InputStreamReader(System.in)),directed);
	}
	
/**
	Reads a graph from the given BufferedReader.
	The input is interpreted as an adjacency list. The first String on each line
	is connected to all the following Strings.
*/
	static public Network<String,Object> read(BufferedReader b) throws IOException
	{
		return read(b,false,false);
	}
		
	static public Network<String,Object> read(BufferedReader b, boolean direct) throws IOException
	{
		return read(b,direct,false);
	}

	static public Network<String,Object> read(BufferedReader b, boolean direct, boolean ident) throws IOException
	{
		Map<String,String> map = new LinkedHashMap<String,String>();

		Network<String,Object> g = new Network<String,Object>(direct,ident);
		for (String s = b.readLine(); s != null; s = b.readLine())
		{
			StringTokenizer t = new StringTokenizer(s);
			if (t.hasMoreTokens())
			{
				String v = standard(t.nextToken(),map);
				g.add(v);
				while (t.hasMoreTokens())
				{
					String u = standard(t.nextToken(),map);
					g.connect(v,u);
					//g.connect(u,v);
				}
			}
		}
		return g;
	}

	static private <T> T standard(T x, Map<T,T> map)
	{
		T y = map.get(x);

		if (y == null)
		{
			map.put(x,x);
			return x;
		}

		return y;
	}

/**
	Reads a graph from standard input as for read(), but the Strings specified in the
	input must be iterpretable as Integers.
*/
	static public Network<Integer,Object> readAsIntegers() throws IOException
	{
		return readAsIntegers(new BufferedReader(new InputStreamReader(System.in)));
	}

	
/**
	Reads a graph from the give BufferedReader read(), but the Strings specified in the
	input must be iterpretable as Integers.
*/
	static public Network<Integer,Object> readAsIntegers(BufferedReader b) throws IOException
	{
		Map<Integer,Integer> map = new LinkedHashMap<Integer,Integer>();
		Network<Integer,Object> g = new Network<Integer,Object>();
		for (String s = b.readLine(); s != null; s = b.readLine())
		{
			StringTokenizer t = new StringTokenizer(s);
			if (t.hasMoreTokens())
			{
				Integer v = standard(new Integer(t.nextToken()),map);
				g.add(v);
				while (t.hasMoreTokens())
					g.connect(v,standard(new Integer(t.nextToken()),map));
			}
		}
		return g;
	}

/**
	Adds the given cliqes to the graph given graph.
*/
	static public <V,E> void graphFromCliques(Collection<? extends Set<V>> cl, MutableGraph<V,E> g)
	{
		for (Set<V> c : cl)
		{
			for (V a : c)
			{
				g.add(a);
				for (V b : c)
					if (a != b)
						g.connect(a,b);
			}
		}
	}

/**
	Adds to h the sub graph of g that is induced by the vertices in v.
*/
	static public <V,E> void inducedSubgraph(Graph<V,E> g, Collection<V> v, MutableGraph<V,E> h)
	{
		for (V x : v)
			if (g.contains(x))
			{
				h.add(x);
				for (V y : g.getNeighbours(x))
					if (v.contains(y))
						h.connect(x,y,g.connection(x,y));
			}
	}

/**
	Returns a set of all the vertices that can be reached from vertex v
	in breadth first search order.
*/
	
	static public <V,E> Set<V> breadthFirstSearch(Graph<V,E> g, V v)
	{
		return breadthFirstSearch(g,v,-1);
	}

/**
	Returns a set of all the vertices that can be reached from v in at most
	max steps in breatdth first serach order.
*/
	static public <V,E> Set<V> breadthFirstSearch(Graph<V,E> g, V v, int max)
	{
		Set<V> out = new LinkedHashSet<V>();

		if (!g.contains(v))
			return out;

		LinkedHashSet<V> todo = new LinkedHashSet<V>();
		todo.add(v);
		todo.add(null);

		int count = max;

		while (!todo.isEmpty())
		{
			V x = todo.iterator().next();
			todo.remove(x);

			if (x == null)
			{
				if (todo.isEmpty())
					break;

				if (count-- == 0)
					break;

				todo.add(x);
			}
			else
			{
				out.add(x);
	
				for (V y : g.getNeighbours(x))
				{
					if (out.contains(y))
						continue;
	
					if (todo.contains(y))
						continue;
	
					todo.add(y);
				}
			}
		}

		return out;
	}
}
