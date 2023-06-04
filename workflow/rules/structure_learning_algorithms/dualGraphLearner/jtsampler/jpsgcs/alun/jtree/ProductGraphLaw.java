package jpsgcs.alun.jtree;

import java.util.Set;

public class ProductGraphLaw<V> extends WSMGraphLaw<V>
{
	public ProductGraphLaw(WSMGraphLaw<V> prior, WSMGraphLaw<V> like)
	{
		WSMGraphLaw[] q  = {prior, like};
		p = (WSMGraphLaw<V>[]) q;
	}

	public ProductGraphLaw(WSMGraphLaw<V>[] x)
	{
		p = (WSMGraphLaw<V>[]) new WSMGraphLaw[x.length];
		for (int i=0; i<p.length; i++)
			p[i] = x[i];
	}

	public double logPotential(Set<V> c, boolean asclique)
	{
		double x = 0;
		for (int i=0; i<p.length; i++)
			if (p[i] != null)
				x += p[i].logPotential(c,asclique);
		return x;
	}

	private WSMGraphLaw<V>[] p = null;
}
