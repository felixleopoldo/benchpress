package jpsgcs.alun.jtree;

import jpsgcs.alun.hashing.RandomIdentitySet;
import jpsgcs.alun.util.Pair;
import jpsgcs.alun.hashing.LinkedIdentityHashMap;

import java.util.Collection;
import java.util.Set;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.LinkedHashMap;
import java.util.Random;

abstract public class JTreeSampler<V>
{
	abstract public UpdateResult randomConnection();
	abstract public UpdateResult randomDisconnection();

	protected V sink = null;

	protected JTree<V> jt = null;
	private WSMGraphLaw<V> pi = null;
	private double temp = 1.0;
	private Random rand = null;

	public JTreeSampler(V s, JTree<V> jtree, WSMGraphLaw<V> p)
	{
		this(jtree,p);
		sink = s;
	}

	public JTreeSampler(JTree<V> jtree, WSMGraphLaw<V> p)
	{
		rand = jtree.rand;
		jt = jtree;
		pi = p;
		temp = 1.0;
	}

	public Random random()
	{
		return rand;
	}

	public UpdateResult randomUpdate()
	{
		return random().nextDouble() < 0.5 ? randomConnection() : randomDisconnection();
	}

	protected double deltaScore(Clique<V> C, V x, V y, int type)
	{
		if (pi == null)
			return 0;

		double score = -pi.logPotential(C,true);
		C.remove(x);
		score += pi.logPotential(C,type == 0 || type == 1);
		C.remove(y);
		score -= pi.logPotential(C,false);
		C.add(x);
		score += pi.logPotential(C,type == 0 || type == 2);
		C.add(y);
		return score;
	}

	protected double deltaScore(Clique<V> C, Set<V> x, Set<V> y, int type)
	{
		if (pi == null)
			return 0;

		double score = -pi.logPotential(C,true);
		C.removeAll(x);
		score += pi.logPotential(C,type == 0 || type == 1);
		C.removeAll(y);
		score -= pi.logPotential(C,false);
		C.addAll(x);
		score += pi.logPotential(C,type == 0 || type == 2);
		C.addAll(y);
		return score;
	}

	protected double deltaScore(Separator<V> S, V x, V y, int type)
	{
		if (pi == null)
			return 0;
		
		double score = pi.logPotential(S,false);
		S.add(x);
		score -= pi.logPotential(S,type == 0 || type == 2);
		S.add(y);
		score += pi.logPotential(S,true);
		S.remove(x);
		score -= pi.logPotential(S,type == 0 || type == 1);
		S.remove(y);
		return score;
	}

	protected double deltaScore(Separator<V> S, Set<V> x, Set<V> y, int type)
	{
		if (pi == null)
			return 0;
		
		double score = pi.logPotential(S,false);
		S.addAll(x);
		score -= pi.logPotential(S,type == 0 || type == 2);
		S.addAll(y);
		score += pi.logPotential(S,true);
		S.removeAll(x);
		score -= pi.logPotential(S,type == 0 || type == 1);
		S.removeAll(y);
		return score;
	}

	public double getTemperature()
	{
		return temp;
	}

	public void setTemperature(double t)
	{
		temp = t;
	}

	public void randomize()
	{
		randomize(jt);
	}

	public void complete()
	{
		complete(jt);
	}

	public static <V> void complete(JTree<V> jt)
	{
		if (jt.separators.size() == 0)
			return;
		for (Separator<V> s : jt.getDistinctSeparators())
			complete(jt,s);
	}

	public static <V> void randomize(JTree<V> jt)
	{
		if (jt.separators.size() == 0)
			return;
		for (Separator<V> s : jt.getDistinctSeparators())
			randomize(jt,s);
	}

	public static <V> void complete(JTree<V> jt, Separator<V> s)
	{
		// Find the sub tree of vertices containing s.
		// and the list of separators with intersection s

		RandomIdentitySet<Clique<V>> Ts = new RandomIdentitySet<Clique<V>>(jt.rand);
		List<Separator<V>> sep = new ArrayList<Separator<V>>();
		jt.collect(Ts,sep,s.getX(),s);

		if (Ts.size() == 2)
			return;

		// Disconnect the equivalent separators.

		for (Separator<V> ss : sep)
			jt.disconnect(ss.getX(),ss.getY());

		// Find the components of the subtree linked by s.

		List<RandomIdentitySet<Clique<V>>> Fs = new ArrayList<RandomIdentitySet<Clique<V>>>();
		Set<Clique<V>> Tscopy = new LinkedHashSet<Clique<V>>(Ts);

		while (!Tscopy.isEmpty())
		{
			RandomIdentitySet<Clique<V>> fsi = new RandomIdentitySet<Clique<V>>(jt.rand);
			jt.collect(fsi,Tscopy.iterator().next(),s);
			Tscopy.removeAll(fsi);
			Fs.add(fsi);
		}

		for (RandomIdentitySet<Clique<V>> fi : Fs)
			for (RandomIdentitySet<Clique<V>> fj : Fs)
				if (fi != fj)
				{
					for (Clique<V> ci : fi)
						for (Clique<V> cj : fj)
						//	jt.connect(ci,cj)
							jt.connect(ci,cj, new Separator<V>(ci,cj,jt.rand));
				}
			
	}

	public static <V> void randomize(JTree<V> jt, Separator<V> s)
	{
		// Find the sub tree of vertices containing s.
		// and the list of separators with intersection s

		RandomIdentitySet<Clique<V>> Ts = new RandomIdentitySet<Clique<V>>(jt.rand);
		List<Separator<V>> sep = new ArrayList<Separator<V>>();
		jt.collect(Ts,sep,s.getX(),s);

		if (Ts.size() == 2)
			return;

		// Disconnect the equivalent separators.

		for (Separator<V> ss : sep)
			jt.disconnect(ss.getX(),ss.getY());

		// Find the components of the subtree linked by s.

		List<RandomIdentitySet<Clique<V>>> Fs = new ArrayList<RandomIdentitySet<Clique<V>>>();
		Set<Clique<V>> Tscopy = new LinkedHashSet<Clique<V>>(Ts);

		while (!Tscopy.isEmpty())
		{
			RandomIdentitySet<Clique<V>> fsi = new RandomIdentitySet<Clique<V>>(jt.rand);
			jt.collect(fsi,Tscopy.iterator().next(),s);
			Tscopy.removeAll(fsi);
			Fs.add(fsi);
		}

		// Draw, with replacement, n-2 components of Ts with probability proportional to their size.

		Map<Clique<V>,RandomIdentitySet<Clique<V>>> h = new LinkedIdentityHashMap<Clique<V>,RandomIdentitySet<Clique<V>>>();
		for (RandomIdentitySet<Clique<V>> f : Fs)
			for (Clique<V> x : f)
				h.put(x,f);

		List<RandomIdentitySet<Clique<V>>> v = new ArrayList<RandomIdentitySet<Clique<V>>>();
		for (int i=0; i<Fs.size() - 2; i++)
			v.add(h.get(Ts.sample()));

		// Put these random list and the set of compoenents into a sorter that will 
		// deliver them in the appropriate order for the pruffer code.
		
		PruferSorter<RandomIdentitySet<Clique<V>>> ps = new PruferSorter<RandomIdentitySet<Clique<V>>>(v,Fs);

		while (ps.hasNext())
		{
			Pair<RandomIdentitySet<Clique<V>>,RandomIdentitySet<Clique<V>>> p = ps.next();
			Clique<V> x = p.getX().sample();
			Clique<V> y = p.getY().sample();

			Separator<V> ss = sep.remove(sep.size()-1);
			ss.setX(x);
			ss.setY(y);
			jt.connect(x,y,ss);
		}
	}
}
