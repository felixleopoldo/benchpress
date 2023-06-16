package jpsgcs.alun.jtree;

import jpsgcs.alun.util.Maths;
import jpsgcs.alun.util.Matrix;
import jpsgcs.alun.markov.Variable;
import jpsgcs.alun.hashing.EqualityIntArrayMap;
import java.util.Set;
import java.util.Map;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;

import jpsgcs.alun.util.SortableSet;
import java.util.TreeSet;

public class MixedMarginalLikelihood extends SMGraphLaw<Variable>
{
	public MixedMarginalLikelihood(MixedDataMatrix d)
	{
		this(d,1,1,1,0,1);
	}

	public MixedMarginalLikelihood(MixedDataMatrix d, double l, double priorn, double priord, double priormean, double priork)
	{
		lambda = l;
		phi = priorn;
		delta = priord;
		gamma = priormean;
		kappa = priork;

		data = d;

		map = new LinkedHashMap<Variable,Integer>();
		store = new LinkedHashMap<Set<Variable>,double[]>();
		
		for (int i=0; i<data.nCols(); i++)
		{
			Variable v = new Variable(data.statesOfColumn(i));
			map.put(v,i);
			if (d.getName(i) != null)
				v.setName(d.getName(i));
		}
	}

	public double logPotential(Set<Variable> ss)
	{
		double[] d = store.get(ss);

		if (d == null)
		{
			//Set<Variable> s = new LinkedHashSet<Variable>(ss);
			Set<Variable> s = new SortableSet<Variable>(ss);
			d = new double[1];
			d[0] = calcPotential(s);
			store.put(s,d);
		}
		
		return d[0];
	}

	public Set<Variable> getVars()
	{
		return map.keySet();
	}

	public void clear()
	{
		store.clear();
	}

	public void show()
	{
		Set<Set<Variable>> t = new TreeSet<Set<Variable>>();
		for (Set<Variable> s : store.keySet())
			t.add(s);

		for (Set<Variable> s : t)
		{
		//	System.out.println(new TreeSet(s)+"\t"+store.get(s)[0]);
			System.out.println(s+"\t"+store.get(s)[0]);
		}
	}

	public int index(Variable v)
	{
		Integer i = map.get(v);
		return i == null ? -1 : i.intValue();
	}

// Private data and methods.

	// Hyper paramameter of Dirichlet prior.
	private double lambda = 1;
	// Hyper parameters for Wishart prior.
	private double phi = 1;
	private double delta = 1;
	// Hyper parameters for conditional Normal prior.
	private double gamma = 0;
	private double kappa = 1;

	private MixedDataMatrix data = null;
	private Map<Variable,Integer> map = null;
	private Map<Set<Variable>,double[]> store = null;

	private double calcPotential(Set<Variable> s)
	{
		int dim = 1;
		int m = 0;
		int p = 0;
		
		for (Variable v : s)
		{
			int j = index(v);
			if (j >= 0)
			{
				if (data.isDiscrete(j))
				{
					dim *= v.getNStates();
					m++;
				}
				else
				{
					p++;
				}
			}
		}

		int[] dind = new int[m];
		int[] gind = new int[p];
		m = 0;
		p = 0;

		for (Variable v : s)
		{
			int j = index(v);
			if (j >= 0)
			{
				if (data.isDiscrete(j))
					dind[m++] = j;
				else
					gind[p++] = j;
			}
		}

		Map<int[],MVNStats> suff = new EqualityIntArrayMap<MVNStats>();

		int[] x = new int[dind.length];
		double[] y = new double[gind.length];

		for (int i=0; i<data.nRows(); i++)
		{
			for (int j=0; j<dind.length; j++)
				x[j] = data.asInt(i,dind[j]);

			for (int j=0; j<gind.length; j++)
				y[j] = data.asDouble(i,gind[j]);

			MVNStats z = suff.get(x);
			if (z == null)
			{
				int[] xx = new int[x.length];
				for (int j=0; j<xx.length; j++)
					xx[j] = x[j];
				z = new MVNStats(gind.length);
				suff.put(xx,z);
			}
		
			z.add(y);
		}

		double result = Maths.logGamma(lambda);
		result -= Maths.logGamma(lambda+data.nRows());

		double l = lambda/dim;
		double k = kappa/dim;
		double d = (delta/dim+p-1)/2.0;

		double[][] P = new double[p][p];
		for (int i=0; i<P.length; i++)
			P[i][i] = phi/dim;

		double priorres = 0;
		priorres += Maths.logGamma(l);
		priorres -= p/2.0*Math.log(k);
		priorres += Maths.logMultiGamma(d,p);
		priorres -= d*Math.log(Matrix.determinant(P));

		for (MVNStats z : suff.values())
		{
			z.fix(P,z.n*kappa/(z.n+kappa),gamma);

			result += Maths.logGamma(l+z.n);
			result -= p/2.0*Math.log(k+z.n);
			result += Maths.logMultiGamma(d+z.n/2.0,p);
			result -= (d+z.n/2.0)*Math.log(Matrix.determinant(z.y));
			result -= priorres;
		}

		return result;
	}
}

class MVNStats
{
	public int n = 0;
	public double[] x = null;
	public double[][] y = null;

	public MVNStats(int k)
	{
		n = 0;
		x = new double[k];
		y = new double[k][k];
		for (int i=0; i<x.length; i++)
		{
			x[i] = 0;
			for (int j=0; j<x.length; j++)
				y[i][j] = 0;
		}
	}

	public void add(double[] z)
	{
		n += 1;
		for (int i=0; i<y.length; i++)
		{
			x[i] += z[i];
			for (int j=0; j<y[i].length; j++)
				y[i][j] += z[i] * z[j];
		}
	}

	public void fix(double[][] P, double nk, double gamma)
	{
		for (int i=0; i<x.length; i++)
			x[i] /= n;

		for (int i=0; i<y.length; i++)
			for (int j=0; j<y[i].length; j++)
			{
				y[i][j] -= n*x[i]*x[j];
				y[i][j] += P[i][j];
				y[i][j] += nk * (x[i]-gamma)*(x[j]-gamma);
			}
	}
}
