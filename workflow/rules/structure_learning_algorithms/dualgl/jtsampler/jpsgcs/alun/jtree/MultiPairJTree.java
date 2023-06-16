package jpsgcs.alun.jtree;

import jpsgcs.alun.util.Pair;
import java.util.Set;
import java.util.LinkedHashSet;

public class MultiPairJTree<V> extends AbstractMultiPair<V>
{
	public MultiPairJTree(V s, JTree<V> jtree, WSMGraphLaw<V> scorer, boolean unidec)
	{
		super(s,jtree,scorer,unidec);
	}

	public MultiPairJTree(JTree<V> jtree, WSMGraphLaw<V> scorer, boolean unidec)
	{
		super(jtree,scorer,unidec);
	}

	private double p = 0.5;
	private double q = 0.5;

	public void chooseCon(Set<V> X, Set<V> Cx, Set<V> S)
	{
		for (V x : Cx)
			if (x != sink && !S.contains(x) && random().nextDouble() < p)
				X.add(x);
	}

	public double pChooseCon(Set<V> X, Set<V> Cx, Set<V> S)
	{
		return Math.pow(p,X.size()) * Math.pow(1-p,Cx.size() - S.size() - X.size());
	}

	public void chooseDis(Set<V> X, Set<V> Y, Set<V> C)
	{
		for (V a : C)
		{
			if (a == sink)
				continue;
			if (random().nextDouble() < q)
				X.add(a);
			if (random().nextDouble() < q)
			{
				if (X.contains(a))
					X.remove(a);
				else
					Y.add(a);
			}
		}
	}

	public double pChooseDis(Set<V> X, Set<V> Y, Set<V> C)
	{
		// Since X == Y only when both empty, which we shouldn't encounter this.
		//return (X.equals(Y) ? 1 : 2) *  Math.pow(q*(1-q),X.size() + Y.size()) * Math.pow(q*q+(1-q)*(1-q),C.size() - X.size() - Y.size());
		return 2 * Math.pow(q*(1-q),X.size() + Y.size()) * Math.pow(q*q+(1-q)*(1-q),C.size() - X.size() - Y.size());
	}
}
