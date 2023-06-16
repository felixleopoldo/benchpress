package jpsgcs.alun.jtree;

import java.util.Set;

public class MultiPairJTree2<V> extends MultiPairJTree1<V>
{
	public MultiPairJTree2(V s, JTree<V> jtree, WSMGraphLaw<V> scorer, boolean unidec)
	{
		super(s,jtree,scorer,unidec);
	}

	public MultiPairJTree2(JTree<V> jtree, WSMGraphLaw<V> scorer, boolean unidec)
	{
		super(jtree,scorer,unidec);
	}

	protected int chooseFrom(int N)
	{
		//return (int) (1.0 + random().nextDouble() * N);
		return 1 + chooseBinomial( N-1, 1.0/N );
	}
		
	protected double pChooseFrom(int N, int n)
	{
		//return 1.0/N;
		return pBinomial( N-1, 1.0/N, n-1);
	}

	protected PairOfInts chooseTwoFrom(int N)
	{
		//int sum = (int) (2.0 + random().nextDouble() * (N-1));
		//int nx = (int) (1.0 + random().nextDouble() * (sum-1));
		//int ny = sum - nx;
		//return new PairOfInts(nx,ny);

		int sum = 2 + chooseBinomial( N-2, 1.0/(N-1) );
		int nx = (int) (1.0 + random().nextDouble() * (sum-1));
		int ny = sum - nx;

		return new PairOfInts(nx,ny);
	}

	protected double pChooseTwoFrom(int N, int nx, int ny)
	{
		//return 1.0/(N-1) * 1.0/(nx+ny-1);

		return pBinomial( N-2, 1.0/(N-1), nx+ny-2) * 1.0 / (nx+ny-1);
	}

	public int chooseBinomial(int n, double p)
	{
		double U = random().nextDouble();
		double q = Math.pow((1-p),n);
		double x = q;

		for (int i=0; i<n+1; i++)
		{
			if (U <= x)
				return i;

			q *= p/(1-p);
			q *= (n-i) / (i+1.0);
			x += q;
		}

		// Shouldn't reach here.
		return -1;
	}

	public static double pBinomial(int n, double p, int x)
	{
		double q = Math.pow(1-p,n);
		for (int i=0; i<x; i++)
		{
			q *= p/(1-p);
			q *= (n-i) / (i+1.0);
		}
		return q;
	}
}
