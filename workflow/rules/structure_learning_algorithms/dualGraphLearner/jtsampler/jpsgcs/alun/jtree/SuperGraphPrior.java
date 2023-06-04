package jpsgcs.alun.jtree;

import jpsgcs.alun.graph.Graph;

import java.util.Set;

public class SuperGraphPrior<V> extends WSMGraphLaw<V>
{
	public SuperGraphPrior(Graph<V,Object> supergraph)
	{
		g = supergraph;
	}

	public double logPotential(Set<V> c, boolean asclique)
	{
		boolean ok = true;

		for (V x : c)
		{
			for (V y : c)
			{
				if (x != y && !g.connects(x,y))
					ok = false;
			}
		}

		if (asclique)
			return  ok ? 0 : Double.NEGATIVE_INFINITY;
		else
			return  ok ? 0 : Double.POSITIVE_INFINITY;
	}

	public String toString()
	{
		return "SuperGraphPrior";
	}

// Private data.

	private Graph<V,Object> g = null;
}
