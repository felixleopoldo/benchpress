package jpsgcs.alun.markov;

import java.util.Set;

public class DenseTable extends Table
{
	public DenseTable(Function f)
	{
		this(f.getVariables());
		for (m.init(); m.next(); )
			setValue(f.getValue());
	}

	public DenseTable(Variable[] vars)
	{
		this (new MultiVariable(vars));
	}

	public DenseTable(Set<Variable> vars)
	{
		this (new MultiVariable(vars));
	}

	public DenseTable(Variable v)
	{
		this (new MultiVariable(v));
	}

	public DenseTable(Variable x, Variable y)
	{
		this (new MultiVariable(x,y));
	}

	public DenseTable(MultiVariable v)
	{
		m = v;
	}

	public Variable[] getVariables()
	{
		return m.getVariables();
	}

	public MultiVariable getMultiVariable()
	{
		return m;
	}

	public void allocate()
	{
		try
		{
			tab = new double[m.getNStates()];
		}
		catch (OutOfMemoryError e)
		{
			System.err.println("Cannot allocate table of length "+m.getNStates()+" in DenseTable.allocate()");
			throw(e);
		}
	}

	public void free()
	{
		tab = null;
	}

	public double getValue()
	{
		return tab[m.getState()];
	}

	public void setValue(double d)
	{
		tab[m.getState()] = d;
	}

	public void increase(double d)
	{
		tab[m.getState()] += d;
	}

	public double sum()
	{
		double t = 0;
		for (int i=0; i<tab.length; i++)
			t += tab[i];
		return t;
	}

	public double sumxlogx()
	{
		double t = 0;
		for (int i=0; i<tab.length; i++)
			if (tab[i] > 0)
				t += tab[i] * Math.log(tab[i]);
		return t;
	}

	public double max()
	{
		double t = Double.NEGATIVE_INFINITY;
		for (int i=0; i<tab.length; i++)
			if (t < tab[i])
				t = tab[i];
		return t;
	}

/*
	public double logLikelihood()
	{
		double ll = 0;
		double nn = 0;

		for (int i=0; i<tab.length; i++)
			if (tab[i] > 0)
			{
				ll += tab[i] * Math.log(tab[i]);
				nn += tab[i];
			}

		return ll - nn * Math.log(nn);
	}

	public double information()
	{
		double h = 0;
		double t = 0;
	
		for (int i=0; i<tab.length; i++)
			if (tab[i] > 0)
			{
				t += tab[i];
				h -= tab[i] * Math.log(tab[i]);
			}

		return h/t + Math.log(t);
	}

*/
/*
	public double degreesOfFreedom()
	{
		return tab.length - 1;
	}
*/

	public void scale(double d)
	{
		for (int i=0; i<tab.length; i++)
			if (tab[i] > 0)
				tab[i] *= d;
	}

/*
	public void log()
	{
		for (int i=0; i<tab.length; i++)
			tab[i] = Math.log(tab[i]);
	}

	public void exp()
	{
		for (int i=0; i<tab.length; i++)
			tab[i] = Math.exp(tab[i]);
	}
*/

	public void increaseAll(double d)
	{
		for (int i=0; i<tab.length; i++)
			tab[i] += d;
	}

	public void invert()
	{
		for (int i=0; i<tab.length; i++)
			if (tab[i] > 0)
				tab[i] = 1.0/tab[i];
	}

	public void clear()
	{
		for (int i=0; i<tab.length; i++)
			tab[i] = 0;
	}
 
/*
	public String toString()
	{
		return "Df"+m.toString();
	}
*/

	public double[] getTable()
	{
		return tab;
	}

	public void setTable(double[] t)
	{
		tab = t;
	}

// Private data and methods.

	protected double[] tab = null;
	private MultiVariable m = null;
}
