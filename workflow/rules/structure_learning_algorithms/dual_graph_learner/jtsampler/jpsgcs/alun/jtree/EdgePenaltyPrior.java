package jpsgcs.alun.jtree;

import java.util.Set;

public class EdgePenaltyPrior<V> extends SMGraphLaw<V>
{
	public EdgePenaltyPrior(double a)
	{
		alpha = a;
	}

	public void setPenalty(double a)
	{
		alpha = a;
	}

	public double getPenalty()
	{
		return alpha;
	}

	public double logPotential(Set<V> c)
	{
		return  -alpha * c.size() * (c.size()-1) /2.0;
	}

	public String toString()
	{
		return "EdgePenalty("+alpha+")";
	}

// Private data.

	private double alpha = 1;
}

