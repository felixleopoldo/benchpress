package jpsgcs.alun.graph;

import java.util.Collection;
import java.util.Collections;
import java.util.Set;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.Random;

/** 
	Decomposable graph backed by a junction tree representation
	and a map from each vertex to an arbitrary clique that 
	contains it.
	The Edge objects associated with a pair of connected vertices
	is always null.
*/

public class DecomposableGraphJT<V,E> extends DecomposableGraph<V,E>
{
// Data.

	protected Network<Set<V>,Object> jtree = null;

	public Network<Set<V>,Object> getJunctionTree()
	{
		return jtree;
	}

// Constructors.

	public DecomposableGraphJT(Random r)
	{
		super(r);
		jtree = new Network<Set<V>,Object>();
	}

	public DecomposableGraphJT()
	{
		this(null);
	}

// Implement DecomposableGrpah interface.

	public boolean isAClique(Set<V> C)
	{
		return jtree.contains(C);
	}

	public Set<Set<V>> getCliques()
	{
		return jtree.getVertices();
	}

	public Set<Set<V>> getSeparators()
	{
		if (map.size() == 0)
			return null;

		Set<Set<V>> separators = new LinkedHashSet<Set<V>>();

		Map<Set<V>,Set<V>> tree = cliqueElimination();
		for (Set<V> C : tree.keySet())
			if (tree.get(C) != null)
				separators.add(intersection(C,tree.get(C)));

		return separators;
	}

	public Set<Set<V>> cliquesContaining(V x)
	{
		return subTree(x).keySet();
	}

	public Collection<Set<V>> connections(Set<V> S)
	{
		if (jtree.contains(S))
			return null;

		Set<V> C = cliqueContaining(S);
		if (C == null)
			return null;

		Set<Set<V>> comps = new LinkedHashSet<Set<V>>();

		for (Set<Set<V>> all = new LinkedHashSet<Set<V>>(subTree(S,C).keySet()); !all.isEmpty(); )
		{

			LinkedList<Set<V>> q = new LinkedList<Set<V>>();
			q.add(all.iterator().next());

			Set<V> union = new LinkedHashSet<V>();
			for (Set<V> u = q.poll(); u != null; u = q.poll())
			{
				all.remove(u);
				union.addAll(u);
				
				for (Set<V> v : jtree.getNeighbours(u))
					if (all.contains(v) && !S.equals(intersection(u,v)))
						q.add(v);
			}

			union.removeAll(S);
			comps.add(union);
		}

		return comps;
	}

	public Collection<Set<V>> disconnections(Set<V> C)
	{
		if (!jtree.contains(C))
			return null;
		Set<Set<V>> pairs = allPairs(C);
		for (Set<V> N : jtree.getNeighbours(C))
			pairs.removeAll(allPairs(N));
		return pairs;
	}

	public boolean connectible(V x, V y)
	{
		return connectors(x,y) != null;
	}

	public boolean disconnectible(V x, V y)
	{
		return disconnector(x,y) != null;
	}

// Implement the MutableGraph interface.

	synchronized public void clear()
	{
		jtree.clear();
		map.clear();
	}

	protected void setPairs(Set<V> S, Set<V> Cxy)
	{
	}

	protected void unsetPairs(Set<V> S, Set<V> Cxy)
	{
	}

	synchronized public boolean add(V v)
	{
		if (map.get(v) != null)
			return false;

		Set<V> C = new LinkedHashSet<V>();
		C.add(v);

		unsetPairs(C,C);

		if (jtree.getVertices().isEmpty())
			jtree.add(C);
		else
			jtree.connect(C,jtree.getVertices().iterator().next());

		setPairs(C,C);

		map.put(v,C);

		return true;
	}

	synchronized public boolean remove(Object x)
	{
		if (map.get(x) == null)
			return false;

		unsetPairs(null,null);

		for (Set<V> S : subTree((V)x).keySet())
		{
			Set<Set<V>> neib = jtree.getNeighbours(S);
			jtree.remove(S);
			S.remove(x);
			jtree.add(S);
			for (Set<V> u : neib)
				jtree.connect(u,S);
			tryMerge(S);
		}

		setPairs(null,null);

		map.remove(x);

		return true;
	}

	private Set<V>[] connectors(V x, V y)
	{
		if (map.get(x) == null || map.get(y) == null)
			return null;

		LinkedList<Set<V>> path = shortestPath(x,y);
		if (path.getFirst().contains(y))
			return null;
			
		Set<V> Cx = path.getFirst();
		Set<V> Cy = path.getLast();
		Set<V> S = intersection(Cx,Cy);

		boolean good = false;

		for (Set<V> A = path.poll(); A != Cy; A = path.poll())
			if (intersection(A,path.peek()).equals(S))
			{
				jtree.disconnect(A,path.peek());
				jtree.connect(Cx,Cy);
				good = true;
				break;
			}

		if (!good)
			return null;

		Set<V>[] res = (Set<V>[]) new Set[3];
		res[0] = S;
		res[1] = Cx;
		res[2] = Cy;
		return res;
	}

	synchronized public boolean connect(V x, V y)
	{
		Set<V>[] cons = connectors(x,y);
		if (cons == null)
			return false;

		Set<V> S = cons[0];


		Set<V> Cx = cons[1];
		Set<V> Cy = cons[2];
		Set<V> Sxy = new LinkedHashSet<V>(S);
		Sxy.add(x);
		Sxy.add(y);

		unsetPairs(S,Sxy);
		
		jtree.disconnect(Cx,Cy);
		jtree.connect(Sxy,Cx);
		jtree.connect(Sxy,Cy);
		
		map(Sxy);

		tryMerge(Cx);
		tryMerge(Cy);

		setPairs(S,Sxy);

		return true;
	}

	protected Set<V> disconnector(V x, V y)
	{
		if (map.get(x) == null || map.get(y) == null)
			return null;

		LinkedList<Set<V>> path = shortestPath(x,y,cliquesContaining(y));

		if (path == null || !path.getFirst().contains(y))
			return null;

		Set<V> Cxy = path.getFirst();

		for (Set<V> N : jtree.getNeighbours(Cxy))
			if (N.contains(x) && N.contains(y))
				return null;
		return Cxy;
	}

	synchronized public boolean disconnect(Object xx, Object yy)
	{
		V x = (V) xx;
		V y = (V) yy;

		Set<V> Cxy = disconnector(x,y);
		if(Cxy == null)
			return false;

		Set<V> S = new LinkedHashSet<V>(Cxy);
		S.remove(x);
		S.remove(y);

		unsetPairs(S,Cxy);

		Set<V> Cx = new LinkedHashSet<V>(Cxy);
		Cx.remove(y);
		Set<V> Cy = new LinkedHashSet<V>(Cxy);
		Cy.remove(x);

		for (Set<V> N : jtree.getNeighbours(Cxy))
			jtree.connect(N,(N.contains(x) ? Cx : Cy));

		jtree.remove(Cxy);
		jtree.connect(Cx,Cy);

		map(Cx);
		map(Cy);

		tryMerge(Cx);
		tryMerge(Cy);

		setPairs(S,Cxy);

		return true;
	}

// Private methods.

	synchronized protected boolean tryMerge(Set<V> C)
	{
		Set<V> N = null;

		for (Set<V> M : jtree.getNeighbours(C))
			if (M.containsAll(C))
			{
				N = M;
				break;
			}

		if (N == null)
			return false;

		jtree.disconnect(C,N);

		for (Set<V> M : jtree.getNeighbours(C))
			jtree.connect(M,N);

		jtree.remove(C);

		map(N);

		return true;
	}

	synchronized protected Set<V> cliqueContaining(Set<V> S)
	{
		for (Set<V> X : jtree.getVertices())
			if (X.containsAll(S))
				return X;
		return null;
	}

	synchronized protected Map<Set<V>,Set<V>> cliqueElimination()
	{
		return subTree(new LinkedHashSet<V>(),jtree.getVertices().iterator().next());
	}

	synchronized protected Map<Set<V>,Set<V>> subTree(V x)
	{
		Set<V> C = new LinkedHashSet<V>();
		C.add(x);
		return subTree(C,map.get(x));
	}

	synchronized protected Map<Set<V>,Set<V>> subTree(Set<V> X, Set<V> Cx)
	{
		Map<Set<V>,Set<V>> tree = new LinkedHashMap<Set<V>,Set<V>>();
		tree.put(Cx,null);

		LinkedList<Set<V>> q = new LinkedList<Set<V>>();
		q.add(Cx);

		for(Set<V> cur = q.poll(); cur != null; cur = q.poll())
		{
			Set<V> prev = tree.get(cur);
			if (cur.containsAll(X))
			{
				for (Set<V> s : jtree.getNeighbours(cur))
					if (s != prev)
					{
						tree.put(s,cur);
						q.add(s);
					}
			}
			else
			{
				tree.remove(cur);
			}
		}

		return tree;
	}

	synchronized protected LinkedList<Set<V>> shortestPath(V x, V y, Set<Set<V>> sub)
	{
		Set<V> Cx = null;
		Set<V> Cy = map.get(y); 

		Map<Set<V>,Set<V>> tree = new LinkedHashMap<Set<V>,Set<V>>();
		tree.put(Cy,null);

		LinkedList<Set<V>> q = new LinkedList<Set<V>>();
		q.add(Cy);

		for (Cx = q.poll() ; !Cx.contains(x); )
		{
			Set<V> prev = tree.get(Cx);
			for (Set<V> next : jtree.getNeighbours(Cx))
				if (sub.contains(next) && next != prev)
				{
					q.add(next);
					tree.put(next,Cx);
				}

			Cx = q.poll();
			if (Cx == null)
				return null;
		}

		LinkedList<Set<V>> path = new LinkedList<Set<V>>();
		for (Cy = Cx; !Cy.contains(y); Cy = tree.get(Cy))
			path.add(Cy);
		path.add(Cy);

		return path;
	}

	synchronized protected LinkedList<Set<V>> shortestPath(V x, V y)
	{
		Set<V> Cx = null;
		Set<V> Cy = map.get(y); 

		Map<Set<V>,Set<V>> tree = new LinkedHashMap<Set<V>,Set<V>>();
		tree.put(Cy,null);

		LinkedList<Set<V>> q = new LinkedList<Set<V>>();
		q.add(Cy);

		for (Cx = q.poll() ; !Cx.contains(x); Cx = q.poll())
		{
			Set<V> prev = tree.get(Cx);
			for (Set<V> next : jtree.getNeighbours(Cx))
				if (next != prev)
				{
					q.add(next);
					tree.put(next,Cx);
				}
		}

		LinkedList<Set<V>> path = new LinkedList<Set<V>>();
		for (Cy = Cx; !Cy.contains(y); Cy = tree.get(Cy))
			path.add(Cy);
		path.add(Cy);

		return path;
	}
}
