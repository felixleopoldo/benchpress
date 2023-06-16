package jpsgcs.alun.jtree;

import jpsgcs.alun.markov.Variable;
import jpsgcs.alun.util.InputFormatter;

import java.io.IOException;
import java.io.PrintStream;
import java.util.Vector;
import java.util.Set;
import java.util.TreeSet;

public class DiscreteDataMatrix implements IntegerMatrix
{
	public DiscreteDataMatrix() throws IOException
	{
		this(new InputFormatter());
	}

	public DiscreteDataMatrix(InputFormatter f) throws IOException
	{
		Vector<int[]> v = new Vector<int[]>();

		int n = -1;

		while (f.newLine())
		{
			int[] t = new int[f.itemsLeftOnLine()];
			for (int i=0; i<t.length; i++)
				t[i] = f.nextInt();

			v.add(t);

			if (n < 0)
			{
				n = t.length;
				continue;
			}

			if (t.length != n)
				throw new RuntimeException("Data row length mismatch in DataMatrix constructor");
		}

		dat = (int[][]) v.toArray(new int[0][]);
	}

	public int nRows()
	{
		return dat.length;
	}

	public int nColumns()
	{
		return dat[0].length;
	}

	public int value(int i, int j)
	{
		return dat[i][j];
	}

	public double correlation(int x, int y)
	{
		double n = 0;
		double mx = 0;
		double my = 0;
		double sxx = 0;
		double sxy = 0;
		double syy = 0;

		for (int i=0; i<nRows(); i++)
		{
			n += 1;
			mx += dat[i][x];
			my += dat[i][y];
			sxy += dat[i][x]*dat[i][y];
			sxx += dat[i][x]*dat[i][x];
			syy += dat[i][y]*dat[i][y];
		}

		mx /= n;
		my /= n;

		sxx = sxx/n - mx*mx;
		syy = syy/n - my*my;
		sxy = sxy/n - mx*my;

		return sxx > 0 && syy > 0 ? sxy / Math.sqrt(sxx * syy) : 0;
	}

	public void writeTo(PrintStream p)
	{
		for (int i=0; i<dat.length; i++)
		{
			for (int j=0; j<dat[i].length; j++)
				p.print(" "+dat[i][j]);
			p.println();
		}
	}
	
	public int[] statesOfColumn(int j)
	{
		Set<Integer> val = new TreeSet<Integer>();
		for (int i=0; i<dat.length; i++)
			val.add(dat[i][j]);

		int[] iii = new int[val.size()];
		int n = 0;
		for (Integer i : val)
			iii[n++] = i.intValue();

		return iii;
	}

/*
	public Variable[] makeVariables()
	{
		Variable[] vars = new Variable[nColumns()];

		for (int i=0; i<vars.length; i++)
		{
			Set<Integer> val = new LinkedHashSet<Integer>();
			for (int j=0; j<dat.length; j++)
				val.add(dat[j][i]);

			int[] iii = new int[val.size()];
			int n = 0;
			for (Integer j : val)
				iii[n++] = j.intValue();

			vars[i] = new Variable(iii.length);
			vars[i].setStates(iii);
		}

		return vars;
	}
*/

// Private data and methods.

	private int[][] dat = null;

// Test main.

	public static void main(String[] args)
	{
		try
		{
			DiscreteDataMatrix x = new DiscreteDataMatrix();
			
			for (int i=0; i<x.nColumns(); i++)
			{
				int[] s = x.statesOfColumn(i);
				for (int j=0; j<s.length; j++)
					System.out.print(" "+s[j]);
				System.out.println();
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
			System.exit(1);
		}
	}

}
