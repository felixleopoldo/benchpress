package jpsgcs.alun.markov;

public class Parameter
{
	public Parameter(String n, double mn, double mx, double df)
	{
		name = n;
		min = mn;
		max = mx;
		def = df;

		value = df;
		logvalue = Math.log(value);
		logonemin = Math.log(1-value);
		changed = true;

		changed = false;
	}

	public String toString()
	{
		return name+"\t"+value;
	}

	public void setValue(double v)
	{
		value = v;
		logvalue = Math.log(value);
		logonemin = Math.log(1-value);
		changed = true;
	}

	public double getValue()
	{
		return value;
	}

	public double logValue()
	{
		return logvalue;
	}

	public double logOneMinusValue()
	{
		return logonemin;
	}

	public boolean changed()
	{
		boolean b = changed;
		changed = false;
		return b;
	}

	public String name() 
	{ 
		return name; 
	}

	public double def() 
	{ 
		return def; 
	}

	public void setDefault(double d)
	{
		def = d;
	}

	public double max() 
	{ 
		return max; 
	}

	public double min() 
	{ 
		return min; 
	}

// Private data.

	private String name = null;
	private double max = 0;
	private double min = 0;
	private double def = 0;
	private boolean changed = false;

	private double value = 0;
	private double logvalue = 0;
	private double logonemin = 0;
}
