package jpsgcs.alun.graph;

import jpsgcs.alun.markov.Parameter;
import jpsgcs.alun.util.RadixPlaneSorter;
import java.util.Collection;
import java.util.LinkedHashSet;

public class LocalLocator<V,E> extends GraphLocator<V,E>
{
	public LocalLocator()
	{
		Parameter[] p = {new Parameter("Repulsion",0,500,100)};
		par = p;
	}

	public double move(LocatedGraph<V,E> g)
	{
		double delta = 0;
		double d = par[0].getValue();
		double gamma = d*d;
		double alpha = 2*d;
		
		Collection<V> vertices = new LinkedHashSet<V>(g.getVertices());
		RadixPlaneSorter<Coord> p = null;
		if (alpha > Double.MIN_VALUE)
		{
			p = new RadixPlaneSorter<Coord>(Math.sqrt(gamma),Math.sqrt(gamma),40);
			for (V a : vertices)
				p.add(g.getCoord(a));
		}	
			
		for (V a : vertices)
		{
			Coord pa = g.getCoord(a);
			if (!pa.m)
				continue;

			Derivatives D = new Derivatives();
			
			if (p != null)
			{
				p.remove(pa);
				addDerivatives(D, localRepulsions(pa,p.getLocal(pa,Math.sqrt(gamma)),gamma), alpha);
			}

			addDerivatives(D, squaredAttractions(pa,g.getCoords(g.getNeighbours(a))), 1);
			delta += update(pa,D);

			if (p != null)
				p.add(pa);
		}

		return delta;
        }
}
