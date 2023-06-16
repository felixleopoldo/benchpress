package jpsgcs.alun.jtree;

import java.util.Set;
import java.util.LinkedHashSet;

public class ThreeCliquePrior<V> extends WSMGraphLaw<V>
{
	public double logPotential(Set<V> c, boolean asclique)
	{
		if (asclique)
		{
			switch(c.size())
			{
			case 3: return 0;

			default:
				//return Double.NEGATIVE_INFINITY;
				return -100;
			}
		}
		else
		{
			switch(c.size())
			{
			case 1: return 0;
			case 2: return 0;

			default:
				//return Double.POSITIVE_INFINITY;
				return 100;
			}
		}
	}
}
