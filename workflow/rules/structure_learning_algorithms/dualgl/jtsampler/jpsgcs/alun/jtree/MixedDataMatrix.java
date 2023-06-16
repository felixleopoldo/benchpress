package jpsgcs.alun.jtree;

import jpsgcs.alun.markov.Variable;
import jpsgcs.alun.util.InputFormatter;

import java.io.IOException;
import java.io.PrintStream;
import java.util.Vector;
import java.util.Set;
import java.util.TreeSet;
import java.util.Map;
import java.util.LinkedHashMap;

import java.util.TreeSet;

public class MixedDataMatrix 
{
	public MixedDataMatrix() throws IOException
	{
		this(new InputFormatter(),false);
	}

	public MixedDataMatrix(boolean h) throws IOException
	{
		this(new InputFormatter(),h);
	}

	public MixedDataMatrix(InputFormatter f, boolean h) throws IOException
	{
		this(f,h,false);
	}

	public MixedDataMatrix(InputFormatter f, boolean h, boolean s) throws IOException
	{
		header = h;
		skipfirst = s;

		if (header)
		{
			Vector<String> v = new Vector<String>();
			f.newLine();
			while (f.newToken())
				v.add(f.getString());
			names = (String[]) v.toArray(new String[0]);
		}

		discrete = null;
		Vector<double[]> v = new Vector<double[]>();

		while (f.newLine())
		{
			if (discrete == null)
			{
				Vector<Boolean> disc = new Vector<Boolean>();
				Vector<Double> val = new Vector<Double>();

				while (f.newToken())
				{
					disc.add(f.nextIsInt());
					if (!skipfirst)
						val.add(f.getDouble());
				}

				discrete = new boolean[disc.size()];
				double[] x = new double[disc.size()];
				for (int i=0; i<discrete.length; i++)
				{
					discrete[i] = disc.get(i);
					if (!skipfirst)
						x[i] = val.get(i);
				}

				if (!skipfirst)
					v.add(x);
			}
			else
			{
				double[] x = new double[discrete.length];
				for (int i=0; i<discrete.length; i++)
					x[i] = ( discrete[i] ? f.nextInt() : f.nextDouble() );
				v.add(x);
			}
		}

		dat = (double[][]) v.toArray(new double[0][]);

		//System.err.println(this);
	}

	public int nCols()
	{
		return discrete.length;
	}

	public int nRows()
	{
		return dat.length;
	}

	public int asInt(int i, int j)
	{
		return (int) (dat[i][j]+0.5);
	}

	public double asDouble(int i, int j)
	{
		return dat[i][j];
	}

	public String getName(int i)
	{
		if (names == null)
			return null;
		else
			return names[i];
	}

	public String toString()
	{
		String del = "\t";

		StringBuffer b = new StringBuffer();

		if (header)
		{
			for (int j=0; j<nCols(); j++)
				b.append(getName(j)+del);
			b.deleteCharAt(b.length()-1);
			b.append("\n");
		}
	
		if (skipfirst)
		{
			for (int j=0; j<nCols(); j++)
				if (isDiscrete(j))
					b.append(statesOfColumn(j).length+del);
				else
					b.append("C"+del);
			b.deleteCharAt(b.length()-1);
			b.append("\n");
		}
		
		for (int i=0; i<dat.length; i++)
		{
			for (int j=0; j<dat[i].length; j++)
			{
				// Don't shorten this to 
				// b.append (discrete[i] ? asInt(i,j) : asDouble(i,j))
				// since the int gets changed to a double since the types of 
				// the outcomes are forced to match.
				if (discrete[j])
					b.append(asInt(i,j));
				else
					b.append(asDouble(i,j));
				if (j < dat[i].length-1)
					b.append(del);
			}
			if (i < dat.length-1)
				b.append("\n");
		}
	
		return b.toString();
	}

	public boolean isDiscrete(int i)
	{
		return discrete[i];
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

	public int[] statesOfColumn(int j)
	{
		if (!discrete[j])
			return null;

		Set<Integer> val = new TreeSet<Integer>();
		for (int i=0; i<dat.length; i++)
			val.add(asInt(i,j));

		int[] iii = new int[val.size()];
		int n = 0;
		for (Integer i : val)
			iii[n++] = i.intValue();

		return iii;
	}


// Private data and methods.
	
	protected boolean header = false;
	protected boolean skipfirst = false;
	protected double[][] dat = null;
	protected boolean[] discrete = null;
	protected String[] names = null;
}
