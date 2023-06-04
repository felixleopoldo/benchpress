package jpsgcs.alun.jtree;

import java.util.Set;
import java.util.LinkedHashSet;

public class MaxCliquePrior<V> extends WSMGraphLaw<V>
{
	public MaxCliquePrior(int maxclique)
	{
		max = maxclique;
	}

	public double logPotential(Set<V> c, boolean asclique)
	{
		return c.size() <= max ? 0 : Double.NEGATIVE_INFINITY;
	}

	private int max = 2;
}
