package jpsgcs.alun.jtree;

import jpsgcs.alun.graph.MutableGraph;
import jpsgcs.alun.graph.Network;
//import jpsgcs.alun.graph.IdentityNetwork;
import jpsgcs.alun.util.RandomBag;
import jpsgcs.alun.util.AlphaSet;
import jpsgcs.alun.util.IntArray;
import jpsgcs.alun.util.IntValue;
import jpsgcs.alun.util.Pair;
import jpsgcs.alun.hashing.RandomIdentitySet;

import java.util.Set;
import java.util.LinkedHashSet;
import java.util.ArrayList;
import java.util.List;
import java.util.LinkedList;
import java.util.Collection;
import java.util.Collections;
import java.util.Map;
import java.util.LinkedHashMap;
import java.util.Random;

/**
	This class makes and manipulates a junction tree for a decomposable graph.
	It uses the Decomposition class in jpsgcs.alun.graph to decompose any given graph
	into its prime subgraphs, but rejects any such decomposition for which
	any prime subgraph is not a clique.

	The definition of junction tree here is the extended version used in the
	Thomas and Green manuscripst that links components of the usual junction
	forest together with links associated with the empty set.
*/

//public class JTree<V> extends IdentityNetwork<Clique<V>,Separator<V>>
public class JTree<V> extends Network<Clique<V>,Separator<V>>
{
	protected RandomBag<Clique<V>> cliques = null;
	protected RandomBag<Separator<V>> separators = null;
	protected MutableGraph<V,?> graph = null;
	protected Random rand = null;

	public JTree(Random r)
	{
//		super();
		super(false,true);
		
		rand = r;
		cliques = new RandomIdentitySet<Clique<V>>(rand);
		separators = new RandomIdentitySet<Separator<V>>(rand);
	}

	public <E> JTree(JTree<V> jt)
	{
		this(jt.rand);
		for (Clique<V> c : jt.getCliques()){
		    this.add(c); // needed for some reason..
        }
        for (Separator<V> s : jt.getAllSeparators()){
            this.connect(s.getX(), s.getY(), s);
        }
		//this.cliques.addAll(jt.getCliques());
		//this.separators.addAll(jt.getAllSeparators());
	}

	public <E> JTree(MutableGraph<V,E> g)
	{
		this(g,null);
	}

	public <E> JTree(MutableGraph<V,E> g, Random r)
	{
		this(g,g.getVertices(),r);
	}

	public <E> JTree(MutableGraph<V,E> g, Collection<V> ord, Random r)
	{
		this(r);

		graph = g;

		Map<Clique<V>,Clique<V>> h = JTrees.cliques(g,ord,rand);
		
		if (h == null)
			throw new GraphNotDecomposableException(); 

		for (Clique<V> c : h.keySet())
		{
			add(c);

			Clique<V> cc = h.get(c);
			//if (!cc.isEmpty())
			if (cc != null)
			{
				Separator<V> s = new Separator<V>(c,cc,rand);
				connect(c,cc,s);
			}
		}
	}

	public Map<Clique<V>,Clique<V>> cliqueElimination()
	{

		// Any clique will do, but it would be nice to have the same peeling
		// sequence each time. If the IdentityMap/Set classes iterated through

		Clique<V> xx = cliques.iterator().next();
		
		for (Clique<V> xxx : cliques)
		{
			if (getNeighbours(xxx).size() < getNeighbours(xx).size())
			{
				xx = xxx;
			}
			else if (getNeighbours(xxx).size() == getNeighbours(xx).size() && xxx.toString().compareTo(xx.toString()) > 0)
			{
				xx = xxx;
			}
		}

		return cliqueElimination(xx);
	}

	public Map<Clique<V>,Clique<V>> cliqueElimination(Clique<V> xx)
	{
		LinkedList<Clique<V>> toDo = new LinkedList<Clique<V>>();
		toDo.add(xx);

		Map<Clique<V>,Clique<V>> map = new LinkedHashMap<Clique<V>,Clique<V>>();
		map.put(xx,null);

		while(!toDo.isEmpty())
		{
			Clique<V> x = toDo.removeLast();
			Clique<V> y = map.get(x);

			for (Clique<V> k : getNeighbours(x))
				if (k != y)
				{
					toDo.add(k);
					map.put(k,x);
				}
		}

		return reverseOfMap(map);
	}

	private Map<Clique<V>,Clique<V>> reverseOfMap(Map<Clique<V>,Clique<V>> map)
	{
		List<Clique<V>> order = new LinkedList<Clique<V>>(map.keySet());
		Collections.reverse(order);

		Map<Clique<V>,Clique<V>> out = new LinkedHashMap<Clique<V>,Clique<V>>();
		for (Clique<V> x : order)
			out.put(x,map.get(x));

		return out;
	}

	public IntArray prufferCode()
	{
		int[] x = new int[cliques.size()-2];
		Map<Clique<V>,IntValue> index = new LinkedHashMap<Clique<V>,IntValue>();
		int n = 0;
		for (Clique<V> c : cliques)
			index.put(c,new IntValue(++n));

		Set<Clique<V>> kept = new LinkedHashSet<Clique<V>>(cliques);
		for (int i=0; i<x.length; i++)
		{
			for (Clique<V> c : cliques)
				if (kept.contains(c))
				{
					Set<Clique<V>> neib = new LinkedHashSet<Clique<V>>(getNeighbours(c));
					neib.retainAll(kept);
					if (neib.size() == 1)
					{
						kept.remove(c);
						x[i] = index.get(neib.iterator().next()).value();
						break;
					}
				}
		}

		return new IntArray(x);
	}

// Basic JTree manipulations.

	public MutableGraph<V,?> graph()
	{
		return graph;
	}

	public boolean add(Clique<V> x)
	{
		if (!contains(x))
			cliques.add(x);
		return super.add(x);
	}

	public boolean remove(Object x)
	{
		cliques.remove(x);
		return super.remove(x);
	}

	public boolean connect(Clique<V> x, Clique<V> y, Separator<V> e)
	{
		if (!connects(x,y))
			separators.add(e);
		return super.connect(x,y,e);
	}

	public boolean disconnect(Object x, Object y)
	{
		separators.remove(connection(x,y));
		return super.disconnect(x,y);
	}

	public RandomBag<Clique<V>> getCliques()
	{
		return cliques;
	}

	public Collection<Set<V>> getSortedCliques()
	{
		Set<Set<V>> x = new AlphaSet<Set<V>>();
		for (Clique<V> c : cliques)
			x.add(new AlphaSet<V>(c));
		return x;
	}

	public Collection<Separator<V>> getDistinctSeparators()
	{
		Collection<Separator<V>> s = new LinkedHashSet<Separator<V>>();
		s.addAll(getAllSeparators());
		return s;
	}

	public RandomBag<Separator<V>> getAllSeparators()
	{
		return separators;
	}
	
	public List<Separator<V>> getEquivalentSeparators(Separator<V> s)
	{
		List<Separator<V>> S = new ArrayList<Separator<V>>();
		Set<Clique<V>> Ts = new LinkedHashSet<Clique<V>>();
		collect(Ts,S,s.getX(),s);
		return S;
	}

// Simple counts.

	public double nEdges()
	{
		double n = 0;
		for (Clique<V> c : cliques)
		{
			int x = c.size();
			n += (x*(x-1))/2;
		}
		for (Separator<V> s : getAllSeparators())
		{
			int x = s.size();
			n -= (x*(x-1))/2;
		}
		return n;
	}

	public int maxClique()
	{
		int x = 0;
		for (Clique s : cliques)
			if (x < s.size())
				x = s.size();
		return x;
	}

	public int totalCliques()
	{
		int x = 0;
		for (Clique s: cliques)
			x += s.size();
		return x;
	}

	public List<Separator<V>> path(Clique<V> x, Clique<V> y, Set<Clique<V>> T)
	{
		if (!contains(x)|| !contains(y))
			return null;

		if (!T.contains(x)|| !T.contains(y))
			return null;

		Network<Clique<V>,Separator<V>> d = new Network<Clique<V>,Separator<V>>(true);
		ArrayList<Clique<V>> v = new ArrayList<Clique<V>>();
		v.add(x);
		boolean found = false;

		for (int i=0; i<v.size() && !found; i++)
		{
			for (Clique<V> w : getNeighbours(v.get(i)))
				if (T.contains(w) && !d.contains(w))
				{
					d.connect(w,v.get(i));
					v.add(w);
					if (w == y)
					{
						found = true;
						break;
					}
				}
		}
		
		List<Separator<V>> p = new ArrayList<Separator<V>>();
		for (Clique<V> z = y; z != x; z = d.outNeighbours(z).iterator().next())
			p.add(connection(z,d.outNeighbours(z).iterator().next()));

		return p;
	}

// Equivalent JTree enumerations

	public double logEnumerate()
	{
		double c = 0;
		for (Separator<V> s : getDistinctSeparators())
			c += logEnumerate(s);
		return c;
	}

	public double logEnumerate(Separator<V> s)
	{
		Set<Clique<V>> Ts = new LinkedHashSet<Clique<V>>();
		collect(Ts,s.getX(),s);

		if (Ts.size() == 2)
			return 0;

		double t = Math.log(Ts.size());
		double c = -2*t;

		while (!Ts.isEmpty())
		{
			int x = Ts.size();
			uncollect(Ts,Ts.iterator().next(),s);
			c += t + Math.log(x-Ts.size());
		}

		return c;
	}

	public long enumerate()
	{
		long c = 1;
		for (Separator<V> s : getDistinctSeparators())
			c *= enumerate(s);
		return c;
	}

	public long enumerate(Separator<V> s)
	{
		Set<Clique<V>> Ts = new LinkedHashSet<Clique<V>>();
		collect(Ts,s.getX(),s);

		if (Ts.size() == 2)
			return 1;

		long c = 1;
		int t = Ts.size();

		while (!Ts.isEmpty())
		{
			int x = Ts.size();
			uncollect(Ts,Ts.iterator().next(),s);
			c *= t * (x-Ts.size());
		}

		return c / (t*t);
	}

	// Starting with the given clique, find all cliques that contain the given vertex 
	protected void collect(Set<Clique<V>> Ts, Clique<V> c, V v)
	{
		LinkedList<Clique<V>> toDo = new LinkedList<Clique<V>>();
		toDo.add(c);

		while (!toDo.isEmpty())
		{
			Clique<V> x = toDo.removeLast();
			Ts.add(x);

			for (Clique<V> k : getNeighbours(x))
			{
				if (Ts.contains(k))
					continue;

				if (!k.contains(v))
					continue;

				toDo.add(k);
			}
		}
	}

	// Starting with the given clique, find all cliques that contain the given set.
	protected void collect(Set<Clique<V>> Ts, Clique<V> c, Set<V> s)
	{
		collect(Ts,c,s,true);
	}

	protected void collect(Set<Clique<V>> Ts, Clique<V> c, Set<V> s, boolean cross)
	{
		LinkedList<Clique<V>> toDo = new LinkedList<Clique<V>>();
		toDo.add(c);

		while (!toDo.isEmpty())
		{
			Clique<V> x = toDo.removeLast();
			Ts.add(x);

			for (Clique<V> k : getNeighbours(x))
			{
				if (Ts.contains(k))
					continue;

				if (!k.containsAll(s))
					continue;

				if (!cross && s.size() == connection(x,k).size())
					continue;

				toDo.add(k);
			}
		}
	}

	// Starting with the given clique, find all cliques that contain the specified separator, and
	// all separators with the same intersection as the specified separator.
	protected void  collect(Set<Clique<V>> Ts, List<Separator<V>> S, Clique<V> c, Separator<V> s)
	{
		LinkedList<Clique<V>> toDo = new LinkedList<Clique<V>>();
		toDo.add(c);

		while (!toDo.isEmpty())
		{
			Clique<V> x = toDo.removeLast();
			Ts.add(x);

			for (Clique<V> k : getNeighbours(x))
			{
				if (Ts.contains(k))
					continue;

				if (!k.containsAll(s))
					continue;

				Separator<V> ss = connection(x,k);
				if (s.size() == ss.size())
					S.add(ss);

				toDo.add(k);
			}
		}
	}

	protected void uncollect(Set<Clique<V>> Ts, Clique<V> c, Separator<V> s)
	{
		LinkedList<Clique<V>> toDo = new LinkedList<Clique<V>>();
		toDo.add(c);

		while (!toDo.isEmpty())
		{
			Clique<V> x = toDo.removeLast();
			Ts.remove(x);

			for (Clique<V> k : getNeighbours(x))
			{
				if (!Ts.contains(k))
					continue;

				if (s.size() == connection(x,k).size())
					continue;

				toDo.add(k);
			}			
		}
	}

	protected void uncollectTo(Set<Clique<V>> Ts, Clique<V> c, Separator<V> s, Set<Clique<V>> Fsi)
	{
		LinkedList<Clique<V>> toDo = new LinkedList<Clique<V>>();
		toDo.add(c);

		while (!toDo.isEmpty())
		{
			Clique<V> x = toDo.removeLast();
			Ts.remove(x);
			Fsi.add(x);

			for (Clique<V> k : getNeighbours(x))
			{
				if (!Ts.contains(k))
					continue;

				if (s.size() == connection(x,k).size())
					continue;

				toDo.add(k);
			}			
		}
	}

// Counts of allowed connections and disconnections.

	public long nConnectionsAllowed()
	{
		long n = 0;
		for (Separator<V> s : getDistinctSeparators())
			n += nConnectionsAllowed(s);
		return n;
	}

	public long nConnectionsAllowed(Separator<V> S)
	{
		Set<Clique<V>> Ts = new LinkedHashSet<Clique<V>>();
		List<Separator<V>> l = new ArrayList<Separator<V>>();
		collect(Ts,l,S.getX(),S);
		
		int[] a = new int[l.size()+1];
		int b = 0;
		
		int i = 0;
		while (!Ts.isEmpty())
		{
			Set<Clique<V>> fsi = new LinkedHashSet<Clique<V>>();
			uncollectTo(Ts,Ts.iterator().next(),S,fsi);

			Set<V> v = new LinkedHashSet<V>();
			for (Clique<V> x : fsi)
				v.addAll(x);
			v.removeAll(S);

			a[i] = v.size();
			b += a[i];
			i++;
		}
		
		long c = 0;
		for (i=0; i<a.length; i++)
			c += a[i]*(b-a[i]);
		return c/2;
	}

	public long nDisconnectionsAllowed()
	{
		long n = 0;
		for (Clique<V> c : cliques)
			n += nDisconnectionsAllowed(c);
		return n;
	}

	public long nDisconnectionsAllowed(Clique<V> C)
	{
		long b = 0;
		for (V x : C)
			for (V y : C)
				if (x != y)
				{
					boolean unique = true;
					for (Clique<V> N : getNeighbours(C))
						if (N.contains(x) && N.contains(y))
							unique = false;
					if (unique)
						b++;
				}

		return b/2;
	}

// By clique and by separator disconnections and connections.

	protected Pair<Clique<V>,Clique<V>> cliquePair(V x, V y, Separator<V> S)
	{
		Clique<V> Cx = null;
		Clique<V> Cy = null;

		if (S.getX().contains(x) && S.getY().contains(y))
		{
			Cx = S.getX();
			Cy = S.getY();
		}
		
		if (S.getY().contains(x) && S.getX().contains(y))
		{
			Cx = S.getY();
			Cy = S.getX();
		}

		if (Cx == null || Cy == null)
		{
			System.err.println("Join not feasible error");
			return null;
		}
	
		if (Cx.contains(y) || Cy.contains(x))
		{
			System.err.println("Already joined error");
			return null;
		}

		return new Pair<Clique<V>,Clique<V>>(Cx,Cy);
	}

	protected Pair<Clique<V>,Clique<V>> cliquePair(Set<V> X, Set<V> Y, Separator<V> S)
	{
		Clique<V> Cx = null;
		Clique<V> Cy = null;

		if (S.getX().containsAll(X) && S.getY().containsAll(Y))
		{
			Cx = S.getX();
			Cy = S.getY();
		}
		
		if (S.getY().containsAll(X) && S.getX().containsAll(Y))
		{
			Cx = S.getY();
			Cy = S.getX();
		}

		if (Cx == null || Cy == null)
		{
			System.err.println("Join not feasible error");
			return null;
		}
	
		if (!disjoint(Cx,Y) || !disjoint(Cy,X))
		{
			System.err.println("Some vertices already joined error");
			return null;
		}

		return new Pair<Clique<V>,Clique<V>>(Cx,Cy);
	}

	protected Pair<Clique<V>,Clique<V>> cliquePair(V x, V y, Clique<V> Cxy)
	{
		if (!Cxy.contains(x) && !Cxy.contains(y))
		{
			System.err.println("Disconnection not feasible by clique");
			return null;
		}

		Clique<V> Cx = null;
		Clique<V> Cy = null;

		Cxy.remove(x);
		Cxy.remove(y);

		for (Clique<V> P : getNeighbours(Cxy))
		{
			if (P.contains(x))
			{
				if (P.contains(y))
				{
					System.err.println("Disconnection not feasible error");
					Cxy.add(x);
					Cxy.add(y);
					return null;
				}
				else
				{
					if (P.containsAll(Cxy))
						Cx = P;
				}
			}
			else
			{
				if (P.contains(y))
				{
					if (P.containsAll(Cxy))
						Cy = P;
				}
			}
		}

		Cxy.add(x);
		Cxy.add(y);

		return new Pair<Clique<V>,Clique<V>>(Cx,Cy);
	}

	protected Pair<Clique<V>,Clique<V>> cliquePair(Set<V> X, Set<V> Y, Clique<V> Cxy)
	{
		if (!Cxy.containsAll(X) && !Cxy.containsAll(Y))
		{
			System.err.println("Disconnection not feasible by clique");
			return null;
		}

		Clique<V> Cx = null;
		Clique<V> Cy = null;

		Clique<V> S = new Clique<V>(Cxy,rand);
		S.removeAll(X);
		S.removeAll(Y);

		for (Clique<V> P : getNeighbours(Cxy))
		{
			if (!disjoint(P,X))
			{
				if (!disjoint(P,Y))
				{
					System.err.println("Disconnection not feasible error");
					return null;
				}
				else
				{
					if (P.containsAll(X) && P.containsAll(S))
						Cx = P;
				}
			}
			else
			{
				if (!disjoint(P,Y))
				{
					if (P.containsAll(Y) && P.containsAll(S))
						Cy = P;
				}
			}
		}

		return new Pair<Clique<V>,Clique<V>>(Cx,Cy);
	}

	private boolean disjoint(Set<V> a, Set<V> b)
	{
		for (V x : a)
			if (b.contains(x))
				return false;
		return true;
	}
}
