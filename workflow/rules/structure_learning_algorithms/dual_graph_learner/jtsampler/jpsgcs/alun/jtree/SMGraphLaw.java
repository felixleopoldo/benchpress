package jpsgcs.alun.jtree;

import java.util.Set;

public abstract class SMGraphLaw<V> extends WSMGraphLaw<V>
{
	abstract public double logPotential(Set<V> a);

	public double logPotential(Set<V> c, boolean ascliqueorseparator)
	{
		return logPotential(c);
	}
}
