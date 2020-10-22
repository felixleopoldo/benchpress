package jpsgcs.alun.jtree;

import jpsgcs.alun.util.Maths;
import jpsgcs.alun.markov.Variable;
import jpsgcs.alun.markov.MultiVariable;
import jpsgcs.alun.markov.DenseTable;
import jpsgcs.alun.markov.SparseTable;
import jpsgcs.alun.markov.Table;
import jpsgcs.alun.markov.MarkovRandomField;

import java.util.Set;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.LinkedHashMap;

public class MultinomialMarginalLikelihood extends SMGraphLaw<Variable>
{
	public MultinomialMarginalLikelihood(Variable[] x, IntegerMatrix y, double l)
	{
		map = new LinkedHashMap<Variable,Integer>();
		for (int i=0; i<x.length; i++)
			map.put(x[i],i);

		data = y;
		lambda = l;

		store = new LinkedHashMap<Set<Variable>,Double>();
	}

	public double logPotential(Set<Variable> ss)
	{
		LinkedHashSet<Variable> s = new LinkedHashSet<Variable>(ss);
		Double d = store.get(s);
		if (d != null)
			return d.doubleValue();

		double dim = 1;
		for (Variable v : s)
			dim *= v.getNStates();

		double lambdai = lambda/dim;

		SparseTable w = new SparseTable(s);
		w.allocate();
	
		for (int i=0; i<data.nRows(); i++)
		{
			for (Variable v : s)
				v.setState(data.value(i,index(v)));
			w.increase(1);
		}

		double z = Maths.logGamma(lambda) - Maths.logGamma(lambda+w.sum()) + w.sumloggamma(lambdai);

		store.put(s,z);
		return z;
	}

	public void clear()
	{
		store.clear();
	}

	public void show()
	{
		for (Set<Variable> s : store.keySet())
		{
			System.out.println(store.get(s).doubleValue()+"\t"+s);
		}
	}

// Private data.

	private IntegerMatrix data = null;
	private double lambda = 1;
	private Map<Variable,Integer> map = null;
	private Map<Set<Variable>,Double> store = null;

	private int index(Variable x)
	{
		return map.get(x).intValue();
	}
}
