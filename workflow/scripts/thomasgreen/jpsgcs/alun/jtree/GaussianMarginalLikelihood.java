package jpsgcs.alun.jtree;

import jpsgcs.alun.util.Matrix;
import jpsgcs.alun.util.Maths;
import java.util.Set;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.LinkedHashMap;

public class GaussianMarginalLikelihood extends SMGraphLaw<Integer>
{
	public GaussianMarginalLikelihood(DoubleMatrix mat, double priorv, double priorn)
	{
		data = mat;
		prior = priorv;
		delta = priorn;

		mu = new double[data.nColumns()];

		for (int j=0; j<data.nColumns(); j++)
		{
			double sum = 0;

			for (int i=0; i<data.nRows(); i++)
				sum += data.value(i,j);

			mu[j] = sum / data.nRows();

			for (int i=0; i<data.nRows(); i++)
				data.setValue(i,j,data.value(i,j)-mu[j]);
		}

		cache = new LinkedHashMap<Set<Integer>,Double>();
	}

	public double logPotential(Set<Integer> b)
	{
		Set<Integer> a = new LinkedHashSet<Integer>(b);

		Double res = cache.get(a);
		if (res == null)
		{
			res = closedform(a);
			cache.put(a,res);
		}

		return res.doubleValue();
	}

	public void clear()
	{
		cache.clear();
	}

// Private data.

	private DoubleMatrix data = null;
	private double[] mu = null;
	private double prior = 0;
	private double delta = 0;
	private Map<Set<Integer>,Double> cache = null;

	private double closedform(Set<Integer> a)
	{
		int[] q = new int[a.size()];
		int ii = 0;
		for (Integer x : a)
			q[ii++] = x.intValue();

		double[][] s = new double[q.length][q.length];
		double[][] p = new double[q.length][q.length];

		for (int j=0; j<q.length; j++)
			for (int k = 0; k<q.length; k++)
			{
				if (k < j)
				{
					p[j][k] = p[k][j];
					s[j][k] = s[k][j];
				}
				else
				{
					p[j][k] = (j==k ? prior : 0);
					s[j][k] = (j==k ? prior : 0);
					for (int i=0; i<data.nRows(); i++)
						s[j][k] += data.value(i,q[j]) * data.value(i,q[k]);
				}
			}


		double x = - data.nRows() * q.length / 2.0 * Math.log(Math.PI);

		double priorx = (delta + q.length -1 ) / 2.0;
		double postrx = (delta + data.nRows() + q.length -1) / 2.0;

		x += Maths.logMultiGamma(postrx, q.length);
		x -= Maths.logMultiGamma(priorx, q.length);

		x += priorx * Math.log(Matrix.determinant(p));
		x -= postrx * Math.log(Matrix.determinant(s));

		return x;
	}
}
