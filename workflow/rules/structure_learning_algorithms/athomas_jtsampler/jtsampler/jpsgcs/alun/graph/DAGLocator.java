package jpsgcs.alun.graph;

import jpsgcs.alun.markov.Parameter;
import jpsgcs.alun.util.RadixPlaneSorter;
import java.util.Collection;
import java.util.LinkedHashSet;

public class DAGLocator<V,E> extends GraphLocator<V,E>
{
	public DAGLocator()
	{
		par = new Parameter[3];
		par[0] = new Parameter("X-Repulsion",0,500,100);
		par[1] = new Parameter("Gravity",0,10,0);
		par[2] = new Parameter("Y-Repulsion",0,500,100);
	}

	public double move(LocatedGraph<V,E> g)
	{
		double differ = 0;
		double d = par[0].getValue();
		double gamma = d*d;
		double alpha = d < Double.MIN_VALUE ? 0 : 1/3.0;
		d = par[1].getValue();
		double beta = d*d*d;
		double delta = par[2].getValue();
		
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
			
			addDerivatives(D, squaredAttractions(pa, g.getCoords(g.getNeighbours(a))), 1);

			if (p != null)
			{
				p.remove(pa);
				addDerivatives(D, localRepulsions(pa, p.getLocal(pa,Math.sqrt(gamma)), gamma), alpha);
			}

			if (beta > 0)
			{
				addDerivatives(D, verticalGenerations(pa, g.getCoords(g.outNeighbours(a)), delta), beta);
				addDerivatives(D, verticalGenerations(pa, g.getCoords(g.inNeighbours(a)), -delta), beta);
			}

			differ += update(pa,D);

			if (p != null)
				p.add(pa);
		}

		return differ;
        }
}
