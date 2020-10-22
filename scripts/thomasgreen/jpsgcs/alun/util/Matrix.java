package jpsgcs.alun.util;

public class Matrix
{
	private static double tol = 0.00000000001;

	public static boolean square(double[][] a)
	{
		return a.length == a[0].length;
	}

	public static boolean symmetrical(double[][] a)
	{
		if (!square(a))
			return false;
		
		for (int i=0; i<a.length; i++)
			for (int j=0; j<a[0].length; j++)
				if (a[i][j] != a[j][i])
					return false;
		
		return true;
	}

	public static double[][] cholesky(double[][] a)
	{
		double[][] l = new double[a.length][a[0].length];
	
		for (int i=0; i<l.length; i++)
		{
			for (int j=0; j<i; j++)
			{
				double tot = 0;
				for (int k=0; k<j; k++)
					tot += l[i][k] * l[j][k];

				if (Math.abs(a[i][j] - a[j][i]) > tol)
					throw new RuntimeException("Matrix is not symmetrical.");
	
				l[i][j] = ( a[i][j] - tot ) / l[j][j];
			}

			double tot = 0;
			for (int k=0; k<i; k++)
				tot += l[i][k] * l[i][k];

			tot = a[i][i] - tot;
			if (tot < 0)
				throw new RuntimeException("Matrix is not positive definite.");

			l[i][i] = Math.sqrt( tot );
		}

		return l;
	}

	public static double[][] transpose(double[][] x)
	{
		double[][] t = new double[x[0].length][x.length];

		for (int i=0; i<t.length; i++)
			for (int j=0; j<t[i].length; j++)
				t[i][j] = x[j][i];

		return t;
	}

	public static double[][] product(double[][] x, double[][] y)
	{
		double[][] p = new double[x.length][y[0].length];

		for (int i=0; i<p.length; i++)
			for (int j=0; j<p[i].length; j++)
			{
				for (int k=0; k<x[0].length; k++)
					p[i][j] += x[i][k] * y[k][j];
			}

		return p;
	}

	public static double[][] inverse(double[][] matrix)
	{
		return invert(matrix).inverse;
	}

	public static double determinant(double[][] matrix)
	{
		return invert(matrix).determinant;
	}

	public static double logDeterminant(double[][] matrix)
	{
		return invert(matrix).logdeterminant;
	}

	public static MatrixInverseData invert(double[][] matrix)
	{
		double[][] x = new double[matrix.length][2*matrix.length];

		for (int i=0; i<x.length; i++)
		{
			for (int j=0; j<x.length; j++)
				x[i][j] = matrix[i][j];
			x[i][i+matrix.length] = 1;
		}

		for (int i=0; i<x.length; i++)
		{
			if (x[i][i] == 0)
				throw new RuntimeException("Matrix is not invertible");

			for (int j=0; j<x.length; j++)
				if (j != i)
				{
					double z = x[j][i]/x[i][i];
					for (int k=0; k<x[j].length; k++)
						x[j][k] -= x[i][k]*z;
				}
		}

		MatrixInverseData d = new MatrixInverseData();

		d.determinant = 1;

		for (int i=0; i<x.length; i++)
		{
			double z = x[i][i];
			for (int j=0; j<x[i].length; j++)
				x[i][j] /= z;
			d.determinant *= z;
			d.logdeterminant += Math.log(z);
		}

		d.inverse = new double[matrix.length][matrix.length];
		for (int i=0; i<d.inverse.length; i++)
			for (int j=0; j<d.inverse[i].length; j++)
				d.inverse[i][j] = x[i][j+d.inverse.length];

		return d;
	}

	public static void main(String[] args)
	{
		double[][] x = { {1, 0.5, 0.5}, {0.5, 1, 0.5}, {0.5, 0.5, 1}};

		double[][] l = cholesky(x);
		for (int i=0; i<l.length; i++)
		{
			for (int j=0; j<l.length; j++)
				System.out.print(l[i][j]+"\t");
			System.out.println();
		}

		l = inverse(x);
		for (int i=0; i<l.length; i++)
		{
			for (int j=0; j<l.length; j++)
				System.out.print(l[i][j]+"\t");
			System.out.println();
		}

		
		double[] mu = {0,1,2};
		double[] y = {1,2,3};
		System.out.println();

		System.out.println(Gauss.logf(y,mu,x));
	}

}
