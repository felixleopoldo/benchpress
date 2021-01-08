package jpsgcs.alun.util;

public class Maths
{
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
		System.out.println(gamma(1));
		System.out.println(logGamma(1));
		System.out.println(gamma(0));
		System.out.println(logGamma(0));


	//	for (double x = 1.9; x < 2.1; x += 0.0001)
	//		System.out.println(x+"\t"+logGamma(x));
	}
}
