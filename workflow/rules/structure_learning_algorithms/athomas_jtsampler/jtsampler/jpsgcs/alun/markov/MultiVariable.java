package jpsgcs.alun.markov;

import java.util.TreeSet;
import java.util.Collection;

public class MultiVariable implements Iterable
{
	public MultiVariable(Variable[] vars)
	{
		v = vars;
		findabc();
	}

        public MultiVariable(Collection<? extends Variable> vars)
        {
                this( (Variable[]) new TreeSet<Variable>(vars).toArray( new Variable[0]) );
        }

	public MultiVariable(Variable x)
	{
		this(asarray(x));
	}

	public MultiVariable(Variable x, Variable y)
	{
		this(asarray(x,y));
	}

	public int getState()
	{
		int state = 0;
		for (int i=0; i<v.length; i++)
			state += a[i]*c[i][v[i].getState()];
		return state;
	}

	public void setState(int k)
	{
		for (int i=0; i<v.length; i++)
		{
			v[i].setState(b[i][k/a[i]]);
			k = k % a[i];
		}
	}

	public boolean hasState(int k)
	{
		for (int i=0; i<v.length; i++)
		{
			if (!v[i].hasState(b[i][k/a[i]]))
				return false;
			k = k % a[i];
		}
		return true;
	}

	public void init()
	{	
		for (Variable u : v)
			u.init();
		count = 0;
	}
		
	public boolean next()
	{
		while (count >=0)
		{
			if (count == v.length)
			{
				count--;
				return true;
			}

			if (v[count].next())
				count++;
			else
				v[count--].init();
		}
		return false;
	}

	public Variable[] getVariables()
	{
		return v;
	}

	public int getNStates()
	{
		return maxs;
	}

	public String toString()
	{
		StringBuffer s = new StringBuffer();
		s.append("[");
		for (Variable x : v)
			s.append(x+",");
		if (v.length > 0)
			s.deleteCharAt(s.length()-1);
		s.append("]");
		return s.toString();
	}

// Private data and methods.

	protected Variable[] v = null;
	private int count = 0;
	private int maxs = 0;
	private int[] a = null;
	private int[][] c = null;
	private int[][] b = null;

	private void findabc()
	{
		double s = 1.0;
		int[] nstates = new int[v.length];

		for (int i=0; i<v.length; i++)
		{
			nstates[i] = v[i].getNStates();
			s *= nstates[i];
			if (s > Integer.MAX_VALUE)
				throw new UnsupportedOperationException("Number of states of MultiVariable "+s+" exeeds Integer.MAX_VALUE "+Integer.MAX_VALUE);
		}

		maxs = (int)(s+0.5);
		
		a = new int[v.length];
		if (a.length > 0)
		{
			a[a.length-1] = 1;
			for (int i=a.length-2; i>=0; i--)
				a[i] = a[i+1]*nstates[i+1];
		}

		c = new int[v.length][];
		b = new int[v.length][];

		for (int i=0; i<c.length; i++)
		{
			int[] st = allStates(v[i]); //v[i].getStates();
			int j = 0;
			for (int k=0; k<st.length; k++)
				if (j < st[k])
					j = st[k];

			b[i] = new int[nstates[i]];
			c[i] = new int[j+1];

			j=0;
			for (int k=0; k<st.length; k++)
			{
				c[i][st[k]] = k;
				b[i][k] = st[k];
			}
		}
	}

	private int[] allStates(Variable v)
	{
		int[] s = new int[v.getNStates()];
		int i=0;
		for (v.init(); v.next(); )
			s[i++] = v.getState();
		return s;
	}
		
	static private Variable[] asarray(Variable x)
	{
		Variable[] u = new Variable[1];
		u[0] = x;
		return u;
	}
		
	static private Variable[] asarray(Variable x, Variable y)
	{
		Variable[] u = new Variable[2];
		u[0] = x;
		u[1] = y;
		return u;
	}
}
