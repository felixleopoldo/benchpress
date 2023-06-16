package jpsgcs.alun.jtree;

import jpsgcs.alun.util.InputFormatter;
import java.io.IOException;
import java.io.PrintStream;
import java.util.Vector;
import java.util.Set;
import java.util.LinkedHashSet;

public class ContinuousDataMatrix implements DoubleMatrix
{
	public ContinuousDataMatrix() throws IOException
	{
		this(new InputFormatter());
	}

	public ContinuousDataMatrix(InputFormatter f) throws IOException
	{
		Vector<double[]> v = new Vector<double[]>();

		int n = -1;

		while (f.newLine())
		{
			double[] t = new double[f.itemsLeftOnLine()];
			for (int i=0; i<t.length; i++)
				t[i] = f.nextDouble();

			v.add(t);

			if (n < 0)
			{
				n = t.length;
				continue;
			}

			if (t.length != n)
				throw new RuntimeException("Data row length mismatch in DataMatrix constructor");
		}

		dat = (double[][]) v.toArray(new double[0][]);
	}

	public int nRows()
	{
		return dat.length;
	}

	public int nColumns()
	{
		return dat[0].length;
	}

	public double value(int i, int j)
	{
		return dat[i][j];
	}

	public void setValue(int i, int j, double x)
	{
		dat[i][j] = x;
	}

	public void writeTo(PrintStream p)
	{
		for (int i=0; i<dat.length; i++)
		{
			for (int j=0; j<dat[i].length; j++)
				p.print(dat[i][j]+" ");
			p.println();
		}
	}

	public void formatTo(PrintStream p)
	{
		formatTo(p,9,5);
	}

	public void formatTo(PrintStream p, int a, int b)
	{
		String format = " %"+a+"."+b+"f";
		for (int i=0; i<dat.length; i++)
		{
			for (int j=0; j<dat[i].length; j++)
				p.printf(format,dat[i][j]);
			p.println();
		}
	}
	
// Private data and methods.

	private double[][] dat = null;
}
