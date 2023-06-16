package jpsgcs.alun.markov;

/**
 A Variable can take only positive integer values, and
 setStates can only restrict the possible states among those
 that were possible on construction.

 No checks are made when setting the current state or state space
 that the given values are valid. If checking is needed use
 CarefulVariable
*/

public class Variable implements Comparable<Variable>
{
	public Variable(int i, int[] s)
	{
		setStates(s);
		id = i;
	}

/**
 Create a new Variable with nn states indexed 0 to nn-1.
*/
	public Variable(int nn)
	{
		m = new int[nn];
		v = new int[nn];
		for (int i=0; i<v.length; i++)
			m[i] = v[i] = i;

		id = count++;
	}

	public Variable(int[] s)
	{
		setStates(s);
		id = count++;
	}

	public Variable(Variable x)
	{
		m = x.m;
		v = x.v;
		state = x.state;
		id = count++;
	}

	public Variable()
	{
		id = count++;
	}


	public int getId()
	{
		return id;
	}

/**
 Returns the current state.
*/
	public int getState()
	{
		return v[state];
	}

/**
 Sets the current state to the given value. No check is made 
 to ensure that the value is valid.
*/
	public void setState(int i)
	{
		state = m[i];
	}

/**
 Returns true if the given integer represents a valid state for the variable.
*/
	public boolean hasState(int i)
	{
		return i < m.length && m[i] >= 0;
	}

/**
 Returns the number of states the variable takes.
*/
	public int getNStates()
	{
		return v== null ? 0 : v.length;
	}

/**
 Initialize the variable.
*/
	public void init()
	{
		state = -1;
	}

/**
 Advance the variable to its next state.
*/
	public boolean next()
	{
		return ++state < v.length;
	}

/**
 Sets the states to the given array of values.
*/
	public void setStates(int[] x)
	{
		if (x == null)
			return;

		int max = 0;
		for (int i=0; i<x.length; i++)
			if (max < x[i])
				max = x[i];
		m = new int[max+1];

		for (int i=0; i<m.length; i++)
			m[i] = -1;

		v = new int[x.length];
		for (int i=0; i<v.length; i++)
		{
			v[i] = x[i];
			m[v[i]] = i;
		}
	}

	public boolean isDefined()
	{
		return v != null;
	}

	public int compareTo(Variable x)
	{
		//return id < x.id ? -1 : id > x.id ? 1 : 0 ;

		return toString().compareTo(x.toString());
	}
		

	public String toString()
	{
		return name == null ?  ""+id : name;
	}

	public void setName(String s)
	{
		name = s;
	}

	public String getName()
	{
		return name;
	}

// 	Private data and methods.

	public int state = 0;
	protected int[] v = null;
	protected int[] m = null;

	public int id = 0;
	private static int count = 0;
	private String name = null;
}
