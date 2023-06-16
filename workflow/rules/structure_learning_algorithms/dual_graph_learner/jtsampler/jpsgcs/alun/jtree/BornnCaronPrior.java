package jpsgcs.alun.jtree;

import java.util.Set;

public class BornnCaronPrior<V> extends WSMGraphLaw<V>
{
	public BornnCaronPrior(double a, double b)
	{
		la = Math.log(a);
		lb = Math.log(b);
	}

	public double logPotential(Set<V> c, boolean asclique)
	{
		if (asclique)
		{
			double res = la;

			for (int i=c.size()-1; i>0; i--)
				res += Math.log(i);

			return res;
		}
		else
		{
			if (c.isEmpty())
				return 0;

			double res = -lb;

			for (int i=c.size()-1; i>0; i--)
				res += Math.log(i);

			return res;
		}
	}

	public String toString()
	{
		return "BornnCaron("+Math.exp(la)+","+Math.exp(lb)+")";
	}

	private double la = 0;
	private double lb = 0;
}
