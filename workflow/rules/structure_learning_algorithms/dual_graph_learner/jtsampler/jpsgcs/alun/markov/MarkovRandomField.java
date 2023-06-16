package jpsgcs.alun.markov;

import jpsgcs.alun.util.Monitor;
import jpsgcs.alun.graph.Network;
import jpsgcs.alun.graph.Graphs;
import jpsgcs.alun.jtree.JTrees;
import jpsgcs.alun.jtree.JTree;
import jpsgcs.alun.jtree.GraphNotDecomposableException;
import jpsgcs.alun.jtree.Clique;

import java.util.Collection;
import java.util.Map;
import java.util.LinkedHashMap;
import java.util.Set;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.ArrayList;
import java.util.TreeSet;
import java.util.Random;

public class MarkovRandomField
{
	public MarkovRandomField()
	{
		g = new Network<Object,Object>();
	}

	public MarkovRandomField(Collection<Function> f)
	{
		this();
		if (f != null)
			for (Function h : f)
				add(h);
	}

	public double logValue()
	{
		double x = 0;

		for (Object f : g.getVertices())
		{
			if (f instanceof Function)
				x += ((Function)f).logValue();
			if (Double.isInfinite(x))
				return x;
		}

		return x;
	}

	public double getValue()
	{
		double x = 1;
		for (Object f : g.getVertices())
			if (f instanceof Function)
				x *= ((Function)f).getValue();
		return x;
	}

	public double logValue(Collection<Variable> vars)
	{
		double x= 0;
			
		for (Variable v : vars)
		{
			Collection<Object> n = g.getNeighbours(v);
			if (n == null)
				continue;

			for (Object f : n)
				((Function)f).unmark();
		}

		for (Variable v : vars)
		{
			Collection<Object> n = g.getNeighbours(v);
			if (n == null)
				continue;

			for (Object o : n)
			{
				Function f = (Function)o;
				
				if (f.isMarked())
					continue;

				x += f.logValue();
				
				if (Double.isInfinite(x))
					return x;

				f.mark();
			}
		}
		
		return x;
	}

	public double logValue(Variable v)
	{
		double x = 0;
		
		Collection<Object> n = g.getNeighbours(v);
		if (n == null)
			return x;

		for (Object f : n)
		{
			x += ((Function)f).logValue();
			if (Double.isInfinite(x))
				return x;
		}
		
		return x;
	}

	public boolean isEmpty()
	{
		return g.getVertices().isEmpty();
	}

	public Set<Function> getFunctions()
	{
		Set<Function> f = new LinkedHashSet<Function>();
		
		for (Object x : g.getVertices())
			if (x instanceof Function)
				f.add((Function)x);

		return f;
	}

	public Set<Variable> getVariables()
	{
		Set<Variable> f = new LinkedHashSet<Variable>();
		
		for (Object x : g.getVertices())
			if (x instanceof Variable)
				f.add((Variable)x);

		return f;
	}

	public Network<Variable,Object> markovGraph()
	{
		Set<Function> f = new LinkedHashSet<Function>();
		Set<Variable> v = new LinkedHashSet<Variable>();
		for (Object x : g.getVertices())
		{
			if (x instanceof Function)
				f.add((Function)x);
			if (x instanceof Variable)
				v.add((Variable)x);
		}

		Network<Variable,Object> m = Functions.markovGraph(f);

		for (Variable x : v)
			m.add(x);

// Need to remove removed variables!!

		Set<Variable> togo = new LinkedHashSet<Variable>();
		for (Variable u : m.getVertices())
			if (!v.contains(u))
				togo.add(u);
		for (Variable u : togo)
			m.remove(u);

		return m;

		//return Functions.markovGraph(f);
	}

	public ModelInfo[] compile(Random rand)
	{
		// Find all the vertices and functions in the variable/function graph.

		Set<Function> f = new LinkedHashSet<Function>();
		Set<Variable> v = new LinkedHashSet<Variable>();
		
		for (Object x : g.getVertices())
		{
			if (x instanceof Function)
				f.add((Function)x);
			if (x instanceof Variable)
				v.add((Variable)x);
		}

		// Make the Markov graph from the list of functions.
		// Triangulate it if necessary. 
		// And find the cliques.

		Network<Variable,Object> m = markovGraph();

		JTree<Variable> jt = null;
		try
		{
			jt = new JTree<Variable>(m,rand);
		}
		catch (GraphNotDecomposableException e)
		{
			//System.err.print("Triangulating ... ");
			//System.err.print(m.getVertices().size()+"  "+Graphs.countEdges(m)+"   ");

			Graphs.triangulate(m);
			jt = new JTree<Variable>(m,rand);
			//System.err.print(jt.getCliques().size()+"   ");
			//System.err.println("done.");
		}

// This is quadratic. Should you do it????
//		JTreeRandomizer.randomize(jt);

		Map<Clique<Variable>,Clique<Variable>> map = jt.cliqueElimination();

		// Map each clique set representation to a plain Tree Set.
		Map<Clique<Variable>,Set<Variable>> clean = new LinkedHashMap<Clique<Variable>,Set<Variable>>();
		for (Clique<Variable> c : map.keySet())
			clean.put(c,new TreeSet<Variable>(c));

		// Find the functions associated with each clique.
		ModelInfo[] output = new ModelInfo[map.size()];
		int n = 0;

		for (Clique<Variable> c : map.keySet())
		{
			Set<Function> fc = getFunctions(c);
			fc.retainAll(f);

			Set<Function> func = new LinkedHashSet<Function>();
			Set<Function> evid = new LinkedHashSet<Function>();

			for (Function ff : fc)
			{
				Set<Variable> u = Functions.asSet(ff.getVariables());

				if (c.containsAll(u))
				{
					func.add(ff);
					continue;
				}

				u.retainAll(v);

				if (c.containsAll(u))
				{
					evid.add(ff);
					continue;
				}
			}

			f.removeAll(func);
			f.removeAll(evid);

			output[n++] = new ModelInfo(clean.get(c),clean.get(map.get(c)),func,evid);
		}

		return output;
	}

	public Set<Object> getElements()
	{
		return g.getVertices();
	}

	public void add(Function f)
	{
		g.add(f);
		for (Variable v : f.getVariables())
			g.connect(f,v);
	}

	public void add(Variable v)
	{
		g.add(v);
	}

	public void addAll(Collection<Function> fs)
	{
		for (Function f : fs)
			add(f);
	}
		
	public void remove(Object v)
	{
		g.remove(v);
	}

	public void clear()
	{
		g.clear();
	 }

	public MarkovRandomField replicate(Map<Variable,Variable> map)
	{
		MarkovRandomField rep = new MarkovRandomField();
		for (Function f : getFunctions())
			rep.add(replicate(map,f));

/*
		Set<Variable> rem = new LinkedHashSet<Variable>();
		for (Object x : rep.g.getVertices())
			if (x instanceof Variable)
				rem.add((Variable)x);

		for (Object x : g.getVertices())
			if (x instanceof Variable)
				rem.remove(map.get(x));
*/

		Set<Variable> rem = rep.getVariables();
		for (Variable x : getVariables())
			rem.remove(map.get(x));

		for (Object x : rem)
			rep.remove(x);

		return rep;
	}

	public Function replicate(Map<Variable,Variable> map, Function f)
	{
		Set<Variable> v = new LinkedHashSet<Variable>();
		for (Variable u : f.getVariables())
			v.add(map.get(u));
		
		MultiVariable w = new MultiVariable(v);
		DenseTable t = new DenseTable(w);
		t.allocate();
		for (w.init(); w.next(); )
		{
			for (Variable u : f.getVariables())
				u.setState(map.get(u).getState());
			t.setValue(f.getValue());
		}

		return t;
	}

	public Network<Object,Object> bipartiteGraph()
	{
		return g;
	}

	public MarkovRandomField subField(Variable v)
	{
		MarkovRandomField f = new MarkovRandomField(getFunctions(v));
		Set<Variable> rem = f.getVariables();
		rem.remove(v);
		for (Variable x : rem)
			f.remove(x);

		return f;
	}

	public MarkovRandomField subField(Collection<Variable> v)
	{
		MarkovRandomField f = new MarkovRandomField(getFunctions(v));
		Set<Variable> rem = f.getVariables();
		rem.removeAll(v);
		for (Variable x : rem)
			f.remove(x);
		return f;
	}

	public void joinField(MarkovRandomField f)
	{
		Set<Variable> vars = getVariables();
		vars.addAll(f.getVariables());
		addAll(f.getFunctions());

		Set<Variable> rem = getVariables();
		rem.removeAll(vars);
		for (Variable v : rem)
			remove(v);
	}

	public Set<Function> getFunctions(Variable v)
	{
		Set<Function> f = new LinkedHashSet<Function>();
		Collection<Object> fn = g.getNeighbours(v);
		if (fn != null)
			for (Object x : fn)
				f.add((Function) x);

		return f;
	}

	public Set<Function> getFunctions(Collection<Variable> vs)
	{
		Set<Function> f = new LinkedHashSet<Function>();
		for (Variable v : vs)
		{
			Collection<Object> fn = g.getNeighbours(v);
			if (fn == null)
				continue;
			for (Object x : fn)
				f.add((Function) x);
		}

		return f;
	}

	public void peel(Variable v)
	{
		Set<Function> f = getFunctions(v);
		for (Function x : f)
			remove(x);
		remove(v);

		MarkovRandomField mrf = new MarkovRandomField(f);
		Set<Variable> u = mrf.getVariables();
		MultiVariable mv = new MultiVariable(u);
		u.remove(v);

		Table t = new DenseTable(u);
		t.allocate();
		for (mv.init(); mv.next(); )
			t.increase(mrf.getValue());
		
		add(t);
	}

	public void peel(Collection<Variable> v)
	{
		peel(v,false);
	}

	public void peel(Collection<Variable> v, boolean showinvol)
	{
		Set<Function> f = getFunctions(v);
		for (Function x : f)
			remove(x);
		for (Variable u : v)
			remove (u);

		MarkovRandomField mrf = new MarkovRandomField(f);
		Set<Variable> u = mrf.getVariables();
		MultiVariable mv = new MultiVariable(u);

		if (showinvol)
			System.err.print("Peeling operation: invol = "+u.size());

		u.removeAll(v);

		if (showinvol)
			System.err.print(" outvol = "+u.size());

		Table t= new DenseTable(u);
		t.allocate();
		for (mv.init(); mv.next(); )
			t.increase(mrf.getValue());

		add(t);
	}

	public void peelAll(Collection<Variable> peel)
	{
		Network<Variable,Object> g = markovGraph();
		List<Variable> p = Graphs.triangulate(g,peel);
		for (Variable v : p)
			peel(v);
	}

	public void peelTo(Collection<Variable> keep)
	{
	// Find markov graph and peeling sequence.

		Monitor m = new Monitor();
		m.quiet(true);
		m.show("Making graph           ");

		Network<Variable,Object> g = markovGraph();

		m.show("Finding max cardinality");

		List<Variable> peel = JTrees.maximumCardinality(g);

	// Combine kept variables into one dummy variable and remove them.

		m.show("Making dummy           ");

		Variable dummy = new Variable();

		int where = 0;

		for (Variable u : keep)
		{
			for (Variable v : g.getNeighbours(u))
			{
				if (!(v == dummy))
					g.connect(dummy,v);
			}
			g.remove(u);
			where = peel.indexOf(u);
			peel.remove(u);
		}

		peel.add(where,dummy);

/*
		for (Variable u : keep)
		{
			for (Variable v : g.getNeighbours(u))
			{
				if (!(v == dummy))
					g.connect(dummy,v);
			}
		}

		int where = 0;
		for (Variable u : keep)
		{
			g.remove(u);
			where = peel.indexOf(u);
			peel.remove(u);
		}
		
		peel.add(where,dummy);
*/

	// Force the peeling sequence to be perfect.

		m.show("Filling in             ");

		Set<Variable> done = new LinkedHashSet<Variable>();
		for (Variable u : peel)
		{
			done.add(u);
			Set<Variable> neigh = new LinkedHashSet<Variable>(g.getNeighbours(u));
			neigh.removeAll(done);
			for (Variable v : neigh)
				for (Variable w : neigh)
					if (v != w && !g.connects(v,w))
						g.connect(v,w);
		}
		
	// Find the junction tree and make the kept variable the root.

		m.show("Finding j tree         ");

		JTree<Variable> jt = new JTree<Variable>(g);
		Clique<Variable> root = null;
		for (Clique<Variable> c : jt.getCliques())
			if (c.contains(dummy))
			{
				root = c;
				break;
			}


		m.show("Finding elimination    ");

		Map<Clique<Variable>,Clique<Variable>> map = jt.cliqueElimination(root);
		map.put(root,new Clique<Variable>(dummy));

	// Do the marginalization.

		m.show("Doing marginalization  ");

		for (Clique<Variable> c : map.keySet())
		{
			Set<Variable> s = new LinkedHashSet<Variable>(c);
			s.removeAll(map.get(c));
			if (!s.isEmpty())
				peel(s);
		}

		m.show("Done                   ");
	}

// Private data and methods.

	protected Network<Object,Object> g = null;
}
