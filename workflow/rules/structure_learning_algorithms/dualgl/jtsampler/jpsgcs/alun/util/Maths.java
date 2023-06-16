package jpsgcs.alun.util;

public class Maths 
{
	public static double logit(double p)
	{
		return Math.log(p/(1-p));
	}

	public static double logistic(double x)
	{
		return 1.0 / (1.0 + Math.exp(-x));
	}

	private static double betacf(double x, double a, double b)
	{
		int maxit = 100;
		double fpmin = 1.0e-30;
		double eps = 3.0e-7;

		double qab = a+b;
		double qap = a + 1;
		double qam = a - 1;
		double c = 1;

		double d = 1 - qab*x/qap;
		if (Math.abs(d) < fpmin)
			d = fpmin;
		d = 1/d;

		double h = d;

		for (int m=1; m<=maxit; m++)
		{
			double m2 = 2*m;
			double aa = m*(b-m)*x / ((qam+m2)*(a+m2));
			
			d = 1 + aa*d;
			if (Math.abs(d) < fpmin)
				d = fpmin;

			c = 1 + aa/c;
			if (Math.abs(c) < fpmin)
				c = fpmin;

			d = 1/d;
			h *= d*c;

			aa = -(a+m)*(qab+m)*x / ((qap+m2)*(a+m2));
			
			d = 1 + aa*d;
			if (Math.abs(d) < fpmin)
				d = fpmin;

			c = 1 + aa/c;
			if (Math.abs(c) < fpmin)
				c = fpmin;
			
			d = 1/d;
			h *= d*c;
		
			if (Math.abs(d*c-1) < eps)
				return h;
		}

		System.err.println("Warning a or b too big, or maxit too small in betacf");
		
		return h;
	}

	public static double incompleteBeta(double x, double a, double b)
	{
		if (x < 0 || x > 1)
			return 0;

		double bt = 0;

		if (x == 0 || x == 1)
			bt = 0;
		else
		{
			bt = a * Math.log(x) + b * Math.log(1-x);
			bt = Math.exp(bt);
		}

		if (x < (a+1)/(a+b+2))
			return bt * betacf(x,a,b)/a;
		else	
			return beta(a,b) - bt * betacf(1-x,b,a)/b;
		
	}

	public static double logBeta(double a, double b)
	{
		return logGamma(a) + logGamma(b) - logGamma(a+b);
	}

	public static double beta(double a, double b)
	{
		return Math.exp(logBeta(a,b));
	}

	public static double incompleteGamma(double s, double z)
	{
		int maxit = 100000;
		double eps = 1e-30;
		double x = 1/s;
		double y = 1/s;

		for (int k=1; k<maxit; k++)
		{
			y *= z/(s+k);
			x += y;
			if (Math.abs(y) < eps)
				break;
		}

		x = Math.log(x) - z + s*Math.log(z);
		return Math.exp(x);
	}

	public static double gamma(double a)
	{
		int g = 7;
		double p[] = 
		{
			0.99999999999980993, 676.5203681218851, -1259.1392167224028, 
			771.32342877765313, -176.61502916214059, 12.507343278686905, 
			-0.13857109526572012, 9.9843695780195716e-6, 1.5056327351493116e-7
		};

		double z = a;

		if (z < 0.5)
			return Math.PI / Math.sin(Math.PI*z) / gamma(1-z);

		z -= 1;
		double x = p[0];
		for (int i=1; i<g+2; i++)
			x += p[i] / (z + i);
		
		double t = z + g + 0.5;
		
		return Math.sqrt(2*Math.PI) * Math.pow(t,z+0.5) * Math.exp(-t) * x; 
	}

	public static double logGamma(double a)
	{
		double z = a;

		if (z < 10)
			return Math.log(gamma(z));

		double x = z * Math.log(z) - z - 0.5 * Math.log(z/2/Math.PI);
		x += 1.0 / 12.0 / z;
		x -= 1.0 / 360.0 / z / z / z;
		x += 1.0 / 1260.0 / z / z / z / z / z;

		return x;
	}

	public static double logMultiGamma(double a, int p)
	{
		double x = p*(p-1)/4.0 * Math.log(Math.PI);

		for (int i=0; i<p; i++)
			x += logGamma(a - i/2.0);

		return x;
	}

	public static void main(String[] args)
	{
/*
		System.out.println(gamma(1));
		System.out.println(logGamma(1));
		System.out.println(gamma(0));
		System.out.println(logGamma(0));


	//	for (double x = 1.9; x < 2.1; x += 0.0001)
	//		System.out.println(x+"\t"+logGamma(x));
*/
		double a = 10;
		double b = 4;

		for (int i=0; i<args.length; i++)
		{
			double x = new Double(args[i]).doubleValue();
			//System.out.println(x+"\t"+incompleteBeta(x,a,b));
			System.out.println(x+"\t"+incompleteGamma(a,x)+"\t"+gamma(a));
			System.out.println(x+"\t"+incompleteGamma(a,x)/gamma(a));
		}
	}
}
