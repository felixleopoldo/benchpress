package jpsgcs.alun.jtree;

import java.util.Random;
import java.util.Set;
import java.util.Map;
import java.util.LinkedHashSet;
import java.util.LinkedHashMap;

public class GGIMLikelihood extends SMGraphLaw<Integer>
{
	public GGIMLikelihood(DoubleMatrix mat, double s, double r, Random rv)
	{
		sig = s;
		rho = r;

		data = mat;

		for (int i=0; i<data.nRows(); i++)
			for (int j=0; j<data.nColumns(); j++)
			{
				double y = data.value(i,j);
				sumsq += y*y;
			}

		v = data.nColumns();
		n = data.nRows();
		
		cache = new LinkedHashMap<Set<Integer>,Double>();

		setRandom(rv);
	}

	public void setRandom(Random rv)
	{
		RV = rv;
	}

	public Random getRandom()
	{
		return RV;
	}

	public double logPotential(Set<Integer> a)
	{
		return f(a);
	}

	public void clear()
	{
		cache.clear();
	}

	public void updateSigma(JTree<Integer> jt)
	{
		double q = 0;

		for (Set<Integer> c : jt.cliques)
			q -= suffstat(c) / (1 - rho + c.size()*rho);
		for (Set<Integer>  s : jt.separators)
			q += suffstat(s) / (1 - rho + s.size()*rho);

		q *= rho;
		q += sumsq;
		q /= 2*(1-rho);

		sig = 1.0 / rgamma(alpha + n*v/2.0, beta + q);
	}

	public void updateRho(JTree<Integer> jt)
	{
		double loga = Math.log(dg(rho)) - logLike(jt);

		double newrho = ginv(g(rho) + RV.nextGaussian());
		double oldrho = rho;
		rho = newrho;

		loga = loga + logLike(jt) - Math.log(dg(rho));

		if (Math.log(RV.nextDouble()) >= loga)
			rho = oldrho;
	}

	public void updateSigmaRho(JTree<Integer> jt)
	{
		double loga = Math.log(dg(rho)) + Math.log(dh(sig)) - logLike(jt);

		double newrho = ginv(g(rho) + RV.nextGaussian());
		double oldrho = rho;
		rho = newrho;

		double newsig = hinv(h(sig) + 0.01*RV.nextGaussian());
		double oldsig = sig;
		sig = newsig;

		loga = loga + logLike(jt) - Math.log(dg(rho)) - Math.log(dh(sig));

		if (Math.log(RV.nextDouble()) >= loga)
		{
			rho = oldrho;
			sig = oldsig;
		}
	}

	public double rho()
	{
		return rho;
	}

	public double sigmasq()
	{
		return sig;
	}

// Private data.

	private DoubleMatrix data = null;
	private double sig = 1;
	private double rho = 0;
	private int n = 0;
	private int v = 0;
	private double sumsq = 0;
	private double alpha = 1;
	private double beta = 1;
	private Map<Set<Integer>,Double> cache = null;
	private Random RV = null;


	private double logLike(JTree<Integer> j)
	{
		double x = - n * v / 2.0 * Math.log( 2 * Math.PI * sig * (1-rho) ) - sumsq / 2.0 / sig / (1-rho) ; 
		
		for (Set<Integer> c : j.cliques)
			x += f(c);

		for (Set<Integer> s : j.separators)
			x -= f(s);

		return x;
	}

	private double f(Set<Integer> a)
	{
		int va = a.size();
		return suffstat(a) * rho / 2 / sig / (1-rho) / (1-rho+va*rho) - n / 2.0 * Math.log(1+va*rho/(1-rho));
	}

	private double g(double r)
	{
		return Math.log( (r + 1.0/(v-1)) / (1-r) );
	}

	private double ginv(double x)
	{
		return 1 - v / ( (v-1) * (Math.exp(x) + 1) );
	}

	private double dg(double r)
	{
		return v / (1-r) / (v-1) / (r + 1.0/(v-1));
	}

	private double h(double s)
	{
		return Math.log(s);
	}

	private double hinv(double x)
	{
		return Math.exp(x);	
	}

	private double dh(double s)
	{
		return 1.0/s;
	}

	private double suffstat(Set<Integer> ss)
	{
		Set<Integer> s = new LinkedHashSet<Integer>(ss);

		Double d = cache.get(s);
		if (d != null)
			return d.doubleValue();

		double x = 0;

		for (int i=0; i<data.nRows(); i++)
		{
			double y = 0;
			for (Integer j : s)
				y += data.value(i,j.intValue());
			x += y*y;
		}

		cache.put(s,x);

		return x;
	}

	public double rgamma(double a, double b)
	{
		// Use Cheng-Feast method since a > 1.
		double c1 = a-1;
		double c2 = (a-1.0/6.0/a)/c1;
		double c3 = 2/c1;
		double c4 = c3+2;
		double c5 = 1/Math.sqrt(a);

		double u, v, w;

		do
		{
			do
			{
				u = RV.nextDouble();
				v = RV.nextDouble();
				if (a > 2.5)
					u = v + c5 * (1 - 1.86*u);
			}
			while (u>1 || u<0);
			w = c2*v/u;
		}
		while (c3*u+w+1/w > c4 && c3*Math.log(u)-Math.log(w)+w > 1);

		return c1*w/b;
	}
}

