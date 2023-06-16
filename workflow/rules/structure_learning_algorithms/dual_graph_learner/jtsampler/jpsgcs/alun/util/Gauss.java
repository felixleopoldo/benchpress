package jpsgcs.alun.util;

import java.util.Random;

public class Gauss
{
	private static final double log2pi = Math.log(2 * Math.PI);

	private static double poly(double x, double[] p)
	{
		double y = 0;
		for (int i=p.length-1 ; i>=0; i--)
			y = y *x + p[i];
		return y;
	}

	public Gauss(Random r)
	{
		rand = r;
	}

	private Random rand = null;

/*
	This function calculated the inverse of the standard normal
	distribution function using the algorithm of Wichura 1988.
	His routine PPND16 is implemented using the a16, b16 ...
	polynomials. To implement PPND7 ust a7, b7 etc.
	PPND16 is accurate to about 16 digits for p in the range
	10e-316 <  min(p,1-p).
*/

	public static double Finv(double p)
	{
		double q = p - 0.5;

		if (Math.abs(q) <= 0.425)
		{
			double x = 0.425 * 0.425 - q * q;
			return q * poly(x,a16) / poly(x,b16);
		}
		else
		{
			double z = 0;
			double r = Math.sqrt(-Math.log(p < 1-p ? p : 1-p));

			if (r <= 5)
				z = Math.abs( poly(r-1.6,c16) / poly(r-1.6,d16) );
			else
				z = Math.abs( poly(r-5,e16) / poly(r-5,f16) );
			
			return (q < 0 ? -z : z);
		}
	}

	public static double F(double x)
	{
		double y = x;
		double s = x;
		for (int i=1; i<100; i++)
		{
			y *= x * x / (2*i+1);
			s += y;
		}

		return 0.5 + s / Math.sqrt(2*Math.PI) * Math.exp(-x*x/2);
	}

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

	public static void main(String[] args)
	{
/*
		for (int i=0; i<args.length; i++)
			System.out.println(Finv(new Double(args[i]).doubleValue()));

		System.out.println(Finv(0.25));
		System.out.println(Finv(0.001));
		System.out.println(Finv(1e-15));
		System.out.println(Finv(1e-20));
		System.out.println(Finv(1-0.25));
		System.out.println(Finv(1-0.001));
		System.out.println(Finv(1-1e-15));
		System.out.println(Finv(1-1e-00));
*/

		Gauss G = new Gauss(new Random());

		for (int i=0; i<10000; i++)
		{
			double x = G.random();
			System.out.println(x + "\t" + (x - Finv(F(x))));
		}
	}



// Constants for Wichura 1988 algorithm for the inverse of the 
// Gaussian distribution function.

	private static final double[] a16 = 
	{
		3.3871328727963666080E0,
		1.3314166789178437745E2,
		1.9715909503065514427E3,
		1.3731693765509461125E4,
		4.5921953931549871457E4,
		6.7265770927008700853E4,
		3.3430575583588128105E4,
		2.5090809287301226727E3
	};


	private static final double[] b16 = 
	{
		1.0,
		4.2313330701600911252E1,
		6.8718700749205790830E2,
		5.3941960214247511077E3,
		2.1213794301586595867E4,
		3.9307895800092710610E4,
		2.8729085735721942674E4,
		5.2264952788528545610E3
	};

	private static final double[] c16 = 
	{
		1.42343711074968357734E0,
		4.63033784615654529590E0,
		5.76949722146069140550E0,
		3.64784832476320460504E0,
		1.27045825245236838258E0,
		2.41780725177450611770E-1,
		2.27238449892691845833E-2,
		7.74545014278341407640E-4
	};

	private static final double[] d16 = 
	{
		1.0,
		2.05319162663775882187E0,
		1.67638483018380384940E0,
		6.89767334985100004550E-1,
		1.48103976427480074590E-1,
		1.51986665636164571966E-2,
		5.47593808499534494600E-4,
		1.05075007164441684324E-9
	};

	private static final double[] e16 = 
	{
		6.65790464350110377720E0,
		5.46378491116411436990E0,
		1.78482653991729133580E0,
		2.96560571828504891230E-1,
		2.65321895265761230930E-2,
		1.24266094738807843860E-3,
		2.71155556874348757815E-5,
		2.01033439929228813265E-7
	};

	private static final double[] f16 = 
	{
		1.0,
		5.99832206555887937690E-1,
		1.36929880922735805310E-1,
		1.48753612908506148525E-2,
		7.86869131145613259100E-4,
		1.84631831751005468180E-5,
		1.42151175831644588870E-7,
		2.04426310338993978564E-15
	};

	private static final double[] a7 = 
	{
		3.3871327179,
		50.434271938,
		159.29113202,
		59.109374720
	};
	
	private static final double[] b7 = 
	{
		1.0,
		17.895169469,
		78.757757664,
		67.187563600
	};

	private static final double[] c7 =
	{
		1.4234372777,
		2.7568153900,
		1.3067284816,
		0.17023821103
	};

	private static final double[] d7 = 
	{
		1.0,
		0.73700164250,
		0.12021132975
	};

	private static final double[] e7 = 
	{
		6.6579051150,
		3.0812263860,
		0.42868294337,
		0.017337203997
	};

	private static final double[] f7 = 
	{
		1.0,
		0.24197894225,
		0.012258202635
	};
}
