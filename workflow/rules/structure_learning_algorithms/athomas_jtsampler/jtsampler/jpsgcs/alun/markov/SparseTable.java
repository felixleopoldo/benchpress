package jpsgcs.alun.markov;

import jpsgcs.alun.util.Maths;
import jpsgcs.alun.util.IntArray;
import java.util.Map;
import java.util.Set;
import java.util.LinkedHashMap;

public class SparseTable extends Table
{
	public SparseTable(Variable[] vars)
	{
		v = new Variable[vars.length];
		for (int i=0; i<v.length; i++)
			v[i] = vars[i];
		x = new int[v.length];
	}

	public SparseTable(Set<Variable> s)
	{
		this((Variable[])(s.toArray(new Variable[0])));
	}

	public Variable[] getVariables()
	{
		return v;
	}

	public double getValue()
	{
		double[] d = curVal(false);
		return d == null ? 0 : d[0];
	}

	public boolean gotValue()
	{
		return curVal(false) != null;
	}

	public void setValue(double y)
	{
		curVal(true)[0] = y;
	}

	public void increase(double y)
	{
		curVal(true)[0] += y;
	}

	public double sum()
	{
		double x = 0;
		for (double[] d : map.values())
			x += d[0];
		return x;
	}

	public int nonzeros()
	{
		int x = 0;
		for (double[] d : map.values())
			if (d[0] > 0)
				x += 1;
		return x;
	}

	public double sumloggamma(double lambda)
	{
		double lgl = Maths.logGamma(lambda);

		double x = 0;
		for (double[] d : map.values())
			x += Maths.logGamma(lambda+d[0]) - lgl;
		return x;
	}

	public double sumxlogx()
	{
		double x = 0;
		for (double[] d : map.values())
			if (d[0] > 0)
				x += d[0]*Math.log(d[0]);
		return x;
	}

/*
	public double sumxlogp(SparseTable p)
	{
		double x = 0;

		for (IntArray i : map.keySet())
		{
			double z = map.get(i).x;
			if (z > 0)
			{
				double y = p.map.get(i).x;
				x += z * Math.log(y);
			}
		}

		return x;
	}
*/

	public double max()
	{
		double x = Double.MIN_VALUE;
		for (double[] d : map.values())
			if (x < d[0])
				x = d[0];
		return x;
	}

	public void scale(double y)
	{
		for (double[] d : map.values())
			d[0] *= y;
	}

	public void increaseAll(double y)
	{
		for (double[] d : map.values())
			d[0] += y;
	}

	public void invert()
	{
		for (double[] d : map.values())
			d[0] = 1.0/d[0];
	}
	
	public void allocate()
	{
		if (map == null)
			map = new LinkedHashMap<IntArray,double[]>();
		map.clear();
	}

	public void free()
	{
		map = null;
	}

	public void clear()
	{
		map.clear();
	}


// Private and protected data and methods.

	protected Variable[] v = null;
	protected int[] x = null;
	protected Map<IntArray,double[]> map = null;

	public Map<IntArray,double[]> getMap()
	{
		return map;
	}

	protected double[] curVal(boolean makeit)
	{
		for (int i=0; i<v.length; i++)
			x[i] = v[i].getState();
		IntArray a = new IntArray(x);
		double[] d = map.get(a);
		if (d == null && makeit)
		{
			d = new double[1];
			map.put(a,d);
		}
		return d;
	}
}
