package jpsgcs.alun.jtree;

import java.util.Set;

public class MultiPairJTree1<V> extends AbstractMultiPair<V>
{
	public MultiPairJTree1(V s, JTree<V> jtree, WSMGraphLaw<V> scorer, boolean unidec)
	{
		super(s,jtree,scorer,unidec);
	}

	public MultiPairJTree1(JTree<V> jtree, WSMGraphLaw<V> scorer, boolean unidec)
	{
		super(jtree,scorer,unidec);
	}

	public void chooseCon(Set<V> X, Set<V> Cx, Set<V> S)
	{
		int N = (Cx.size() - S.size());
		int n = chooseFrom(N);
		double M = 0;
		double m = 0;

		for (V x : Cx)
			if (!S.contains(x))
			{
				if (random().nextDouble() < (n-m)/(N-M))
				{
					X.add(x);
					m += 1;
				}
				M += 1;
			}
	}

	public double pChooseCon(Set<V> X, Set<V> Cx, Set<V> S)
	{
		int N = Cx.size() - S.size();
		int n = X.size();
		return pChooseFrom(N,n) * pCombos(N,n);
	}

	public void chooseDis(Set<V> X, Set<V> Y, Set<V> C)
	{
		int N = C.size();
		PairOfInts pair = chooseTwoFrom(N);
		int nx = pair.x;
		int ny = pair.y;

		double M = 0;
		double mx = 0;
		double my = 0;

		for (V a : C)
		{
			double u = random().nextDouble();
			if (u < (nx-mx) / (N-M))
			{
				X.add(a);
				mx += 1;
			}
			else if (u < (nx - mx + ny - my) / (N-M))
			{
				Y.add(a);
				my += 1;
			} 
			M += 1;
		}
	}

	public double pChooseDis(Set<V> X, Set<V> Y, Set<V> C)
	{
		int N = C.size();
		int nx = X.size();
		int ny = Y.size();
		return 2 *  pChooseTwoFrom(N,nx,ny) * pCombos(N,nx) * pCombos(N-nx,ny);
	}

	private double pCombos(int N, int n)
	{
		double x = 1;
		for (int i=0; i<n; i++)
			x *= (n-i) / (double) (N-i);
		return x;
	}

	protected int chooseFrom(int N)
	{
		return (int) (1.0 + random().nextDouble() * N);
	}
		
	protected double pChooseFrom(int N, int n)
	{
		return 1.0/N;
	}

	protected PairOfInts chooseTwoFrom(int N)
	{
		int sum = (int) (2.0 + random().nextDouble() * (N-1));
		int nx = (int) (1.0 + random().nextDouble() * (sum-1));
		int ny = sum - nx;
		return new PairOfInts(nx,ny);
	}

	protected double pChooseTwoFrom(int N, int nx, int ny)
	{
		return 1.0/(N-1) * 1.0/(nx+ny-1);
	}
}

class PairOfInts
{
	public PairOfInts(int a, int b)
	{
		x = a;
		y = b;
	}

	int x = 0;
	int y = 0;
}
