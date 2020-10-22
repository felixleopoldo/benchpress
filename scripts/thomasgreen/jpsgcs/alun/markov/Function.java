package jpsgcs.alun.markov;

import jpsgcs.alun.util.MarkedObject;
import java.util.Set;

/** 
 A Function is a mapping from the states of a set of variables to a double.
*/
abstract public class Function implements MarkedObject
{
/**
 Returns the current value of the Function.
*/
	abstract public double getValue();

/**
 Returns an array of the variables that are arguments to the function.
*/
	abstract public Variable[] getVariables();

	public Parameter[] getParameters()
	{
		return noparameters;
	}

	public double logValue()
	{
		return Math.log(getValue());
	}

	public final boolean isMarked()
	{
		return m;
	}

	public final void mark()
	{
		m = true;
	}

	public final void unmark()
	{
		m = false;
	}

	public String toString()
	{
		StringBuffer b = new StringBuffer();
		b.append("(");
		for (Variable v : getVariables())
			b.append(v+",");
		if (getVariables().length > 0)
			b.deleteCharAt(b.length()-1);
		b.append(")");
		b.append("\n");
		MultiVariable v = new MultiVariable(getVariables());
		for (v.init(); v.next(); )
		{
			b.append("\t");
			for (Variable u : getVariables())
				b.append(u.getState()+" ");
			b.append("\t"+getValue());
			b.append("\n");
		}

		return b.toString();
	}

	private boolean m = false;
	private final static Parameter[] noparameters = new Parameter[0];
}
