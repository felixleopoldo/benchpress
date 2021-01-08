package jpsgcs.alun.util;

import java.util.Random;

public class Gauss
{
	private static final double log2pi = Math.log(2 * Math.PI);

	public Gauss(Random r)
	{
		rand = r;
	}

	private Random rand = null;

	public static double logf(double x, double mu, double sigma2)
	{
		return - 0.5 * ( (x-mu) * (x-mu) / sigma2  + log2pi + Math.log(sigma2) );
	}

	public static double f(double x, double mu, double sigma2)
	{
		return Math.exp(logf(x,mu,sigma2));
	}

	public static double logf(double x)
	{
		return - 0.5 * ( x*x + log2pi );
	}

	public static double f(double x)
	{
		return Math.exp(logf(x));
	}

	public static double logf(double[] x, double[] mu, double[][] invSigma, double logDeterminant)
	{
		double res = 0;

		for (int i=0; i<x.length; i++)
			for (int j=0; j<x.length; j++)
				res += (x[i]-mu[i]) * invSigma[i][j] * (x[j]-mu[j]);

		return - 0.5 * ( res + logDeterminant + x.length * log2pi );
	}

	public static double logf(double[] x, double[] mu, double[][] Sigma)
	{
		MatrixInverseData mdata = Matrix.invert(Sigma);
		return logf( x, mu, mdata.inv(), Math.log(mdata.det()) );
	}

	public static double f(double[] x, double[] mu, double[][] Sigma)
	{
		return Math.exp(logf(x,mu,Sigma));
	}

	public double random()
	{
		return rand.nextGaussian();
	}

	public double random(double mu, double sigma2)
	{
		return random() * Math.sqrt(sigma2) + mu;
	}

	public double[] random(double[] mu, double[][] Sigma)
	{
		double[][] chol = Matrix.cholesky(Sigma);
		return random(mu,chol,true);
	}

	public double[] random(double[] mu, double[][] Cholesky, boolean dummy)
	{
		double[] x =  new double[mu.length];

		double[] z = new double[mu.length];
		for (int i=0; i<z.length; i++)
			z[i] = random();

		for (int i=0; i<x.length; i++)
		{
			x[i] = mu[i];
			for (int j=0; j<=i; j++)
				x[i] += Cholesky[i][j] * z[j];
		}

		return x;
	}
}
