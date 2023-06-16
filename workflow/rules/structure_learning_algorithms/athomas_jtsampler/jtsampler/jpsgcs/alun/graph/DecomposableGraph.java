package jpsgcs.alun.graph;

import jpsgcs.alun.util.AlphaSet;

import java.util.Set;
import java.util.LinkedHashSet;
import java.util.TreeSet;
import java.util.Map;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.Collection;
import java.util.Collections;
import java.util.Random;

abstract public class DecomposableGraph<V,E> implements MutableGraph<V,E>
{
	protected Map<V,Set<V>> map = null;
	protected Random rand = null;

	public DecomposableGraph(Random r)
	{
		map = new LinkedHashMap<V,Set<V>>();
		rand = r;
	}

	public DecomposableGraph()
	{
		this(null);
	}

	abstract public Set<Set<V>> getCliques();

	abstract public Set<Set<V>> getSeparators();

	abstract public Set<Set<V>> cliquesContaining(V x);

	abstract public Collection<Set<V>> connections(Set<V> S);
	
	abstract public Collection<Set<V>> disconnections(Set<V> C);

	abstract public boolean connectible(V x, V y);

	abstract public boolean disconnectible(V x, V y);

	abstract public boolean isAClique(Set<V> C);

	public Set<Set<V>> cliquesContaining(V x, V y)
	{
		Set<Set<V>> Tx = cliquesContaining(x);
		Set<Set<V>> Txy = new LinkedHashSet<Set<V>>();
		for (Set<V> X : Tx)
			if (X.contains(y))
				Txy.add(X);
		return Txy;
	}

// Legal move management.

	public Set<Set<V>> sortedSets(Collection<Set<V>> x)
	{
		Set<Set<V>> y = new TreeSet<Set<V>>();
		for (Set<V> X : x)
			y.add(new AlphaSet<V>(X));
		return y;
	}

	public void randomPair(V[] res)
	{
		//Set<Set<V>> a = new LinkedHashSet<Set<V>>(getCliques());
		//a.addAll(getSeparators());

		Set<Set<V>> a = new TreeSet<Set<V>>();
		for (Set<V> Z : getCliques())
			a.add(new AlphaSet<V>(Z));
		for (Set<V> Z : getSeparators())
			a.add(new AlphaSet<V>(Z));


		Set<V>[] sets = (Set<V>[]) a.toArray(new Set[0]);

		double[] x = new double[sets.length];
		double tot = 0;
		for (int i=0; i<sets.length; i++)
		{
			x[i] = isAClique(sets[i]) ? nDisconnections(sets[i]) : nConnections(sets[i]);
			tot += x[i];
		}

		double U = tot*rand.nextDouble();
		tot = 0;

		Set<V> X = null;

		for (int i=0; i<sets.length; i++)
		{
			tot += x[i];
			if (U <= tot)
			{
				X = sets[i];
				break;
			}
		}

		if (isAClique(X))
		{
			Collection<Set<V>> pairs = sortedSets(disconnections(X));
//System.err.println("Clique\t"+X);
//System.err.println("\t"+pairs);
			U = pairs.size() * rand.nextDouble();
			tot = 0;
			
			for (Set<V> p : pairs)
			{
				tot += 1;
				if (U <= tot)
				{
					Object[] q = p.toArray();
					res[0] = (V) q[0];
					res[1] = (V) q[1];
					return;
				}
			}
		}
		else
		{
			Set<V>[] comps = (Set<V>[]) sortedSets(connections(X)).toArray(new Set[0]);
//System.err.println("Separator\t"+X);
//for (Set<V> Z : comps) System.err.println("\t"+Z);

			double n = 0;
			double[] y = new double[comps.length];

			for (int i=0; i<comps.length; i++)
			{
				y[i] = comps[i].size();
				n += y[i];
			}

			tot = 0;
			for (int i=0; i<y.length; i++)
				tot += y[i] * (n-y[i]);

			U = tot * rand.nextDouble();
			tot = 0;
			int I = 0;
	
			for (int i=0; i<comps.length; i++)
			{
				tot += y[i] * (n - y[i]);
				if (U <= tot)
				{
					I = i;
					break;
				}
			}

			U = (n-y[I]) * rand.nextDouble();
			tot = 0;
			int J = 0;

			for (int i=0; i<comps.length; i++)
				if (i != I)
				{
					tot += y[i];
					if (U <= tot)
					{
						J = i;
						break;
					}
				}

			U = comps[I].size() * rand.nextDouble();
			tot = 0;
			for (V v : comps[I])
			{
				tot += 1;
				if (U <= tot)
				{
					res[0] = v;
					break;
				}
			}

			U = comps[J].size() * rand.nextDouble();
			tot = 0;
			for (V v : comps[J])
			{
				tot += 1;
				if (U <= tot)
				{
					res[1] = v;
					break;
				}
			}

			return;
		}
	}

	public int nConnections(Set<V> S)
	{
		Collection<Set<V>> comps = connections(S);
		if (comps == null)
			return 0;

		int n = 0;
		for (Set<V> X : comps)
			n += X.size();

		int res = 0;
		for (Set<V> X : comps)
			res += (X.size()*(n-X.size()));

		return res/2;
	}
	
	public int nDisconnections(Set<V> C)
	{
		Collection<Set<V>> pairs = disconnections(C);
		if (pairs == null)
			return 0;
		return pairs.size();
	}

	public int nConnections()
	{
		int n = 0;
		for (Set<V> S : getSeparators())
			n += nConnections(S);
		return n;
	}

	public int nDisconnections()
	{
		int n = 0;
		for (Set<V> C : getCliques())
			n += nDisconnections(C);
		return n;
	}

// Implement complete Graph interface.

	public boolean contains(Object x)
	{
		return map.get(x) != null;
	}

	public E connection(Object u, Object v)
	{
		return null;
	}

	public Collection<E> connections(Object u)
	{
		return null;
	}

	public Set<V> getVertices()
	{
		return Collections.unmodifiableSet(map.keySet());
	}

	public boolean isDirected()
	{
		return false;
	}

	public Collection<V> inNeighbours(Object x)
	{
		return getNeighbours(x);
	}

	public Collection<V> outNeighbours(Object x)
	{
		return getNeighbours(x);
	}

	public boolean connect(V u, V v, E e)
	{
		return connect(u,v);
	}

	synchronized public boolean connects(Object x, Object y)
	{
		if (map.get(x) == null || map.get(y) == null)
			return false;

		return !cliquesContaining((V) x,(V) y).isEmpty();
	}

	synchronized public Collection<V> getNeighbours(Object x)
	{
		if (map.get(x) == null)
			return null;

		Set<V> N = new LinkedHashSet<V>();

		for (Set<V> S : cliquesContaining((V) x))
			N.addAll(S);

		N.remove(x);

		return N;
	}

// Protected helper functions.

	protected final Set<V> intersection(Set<V> A, Set<V> B)
	{
		Set<V> S = new LinkedHashSet<V>(A);
		S.retainAll(B);
		return S;
	}

	protected final void map(Set<V> S)
	{
		for (V v : S)
			map.put(v,S);
	}

	protected Set<Set<V>> allPairs(Set<V> C)
	{
		Set<Set<V>> res = new LinkedHashSet<Set<V>>();
		for (V x : C)
			for (V y : C)
			{
				Set<V> P = new LinkedHashSet<V>();
				P.add(x);
				P.add(y);
				if (P.size() == 2)
					res.add(P);
			}
		return res;
	}
}
