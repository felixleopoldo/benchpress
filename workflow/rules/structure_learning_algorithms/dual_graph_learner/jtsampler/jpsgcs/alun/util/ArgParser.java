package jpsgcs.alun.util;

import java.io.PrintStream;
import java.io.InputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.FileNotFoundException;

public class ArgParser
{
	public ArgParser(String[] args)
	{
		a = new String[args.length];
		for (int i=0; i<args.length; i++)
			a[i] = args[i];
	}

	public int nArgs()
	{
		return a.length;
	}

	public String arg(int i)
	{
		return a[i];
	}

	public void remove(int x)
	{
		String[] b = new String[a.length-1];
		for (int i=0, j=0; i<a.length; i++)
			if (i != x)
				b[j++] = a[i];
		a = b;
	}

	public void remove(int x, int y)
	{
		String[] b = new String[a.length-2];
		for (int i=0, j=0; i<a.length; i++)
			if (i != x && i != y)
				b[j++] = a[i];
		a = b;
	}

	public void remove(int x, int y, int z)
	{
		String[] b = new String[a.length-3];
		for (int i=0, j=0; i<a.length; i++)
			if (i != x && i != y && i != z)
				b[j++] = a[i];
		a = b;
	}

	public boolean gotOpt(String x)
	{
		return gotOpt(x,true);
	}

	public boolean gotOpt(String x, boolean del)
	{
		boolean res = false;

		for (int i=0; i<a.length; i++)
			if (a[i].equals(x))
			{
				res = true; 
				if (del)
					remove(i);
			}

		if (errout != null)
			errout.println("Got "+x+" = "+res);

		return res;
	}

	public String stringAfter(String x, String defval)
	{
		return stringAfter(x,defval,true);
	}

	public String stringAfter(String x, String defval, boolean del)
	{
		String res = defval;

		for (int i=0; i<a.length; i++)
			if (a[i].equals(x))
			{
				res = a[i+1];
				if (del)
					remove(i,i+1);
			}

		if (errout != null)
			errout.println(x+" = "+ res);
		
		return res;
	}

	public int intAfter(String x, int defval)
	{
		return intAfter(x,defval,true);
	}

	public int intAfter(String x, int defval, boolean del)
	{
		int res = defval;

		for (int i=0; i<a.length; i++)
			if (a[i].equals(x))
			{
				res = new Integer(a[i+1]).intValue();
				if (del)
					remove(i,i+1);
			}

		if (errout != null)
			errout.println(x+" = "+ res);
		
		return res;
	}

	public double[] doublesAfter(String x, double[] defval)
	{
		return doublesAfter(x,defval,true);
	}

	public double[] doublesAfter(String x, double[] defval, boolean del)
	{
		double[] res = defval;

		for (int i=0; i<a.length; i++)
			if (a[i].equals(x))
			{
				for (int j = 0; j<res.length; j++)
					res[j] = new Double(a[i+1+j]).doubleValue();
				if (del)
				{
					for (int j = res.length-1; j >= 0; j--)
						remove(i+1+j);
					remove(i);
				}
			}

		if (errout != null)
			errout.println(x+" = "+ res);
		
		return res;
	}


	public double doubleAfter(String x, double defval)
	{
		return doubleAfter(x,defval,true);
	}

	public double doubleAfter(String x, double defval, boolean del)
	{
		double res = defval;

		for (int i=0; i<a.length; i++)
			if (a[i].equals(x))
			{
				res = new Double(a[i+1]).doubleValue();
				if (del)
					remove(i,i+1);
			}

		if (errout != null)
			errout.println(x+" = "+ res);
		
		return res;
	}

	public InputStream inputStreamAfter(String x, InputStream defval) throws FileNotFoundException
	{
		return inputStreamAfter(x,defval,true);
	}

	public InputStream inputStreamAfter(String x, InputStream defval, boolean del) throws FileNotFoundException
	{
		InputStream res = defval;

		for (int i=0; i<a.length; i++)
			if (a[i].equals(x))
			{
				res = new FileInputStream(a[i+1]);
				if (del)
					remove(i,i+1);
			}

		if (errout != null)
			errout.println(x+" = "+ res);

		return res;
	}

	public PrintStream printStreamAfter(String x, PrintStream defval) throws FileNotFoundException
	{
		return printStreamAfter(x,defval,true);
	}

	public PrintStream printStreamAfter(String x, PrintStream defval, boolean del) throws FileNotFoundException
	{
		PrintStream res = defval;

		for (int i=0; i<a.length; i++)
			if (a[i].equals(x))
			{
				res = new PrintStream(new FileOutputStream(a[i+1]));
				if (del)
					remove(i,i+1);
			}

		if (errout != null)
			errout.println(x+" = "+ res);

		return res;
	}

	public InputFormatter inputFormatterAfter(String x, InputFormatter defval) throws IOException
	{
		return inputFormatterAfter(x,defval,true);
	}

	public InputFormatter inputFormatterAfter(String x, InputFormatter defval, boolean del) throws IOException
	{
		InputFormatter res = defval;

		for (int i=0; i<a.length; i++)
			if (a[i].equals(x))
			{
				res = new InputFormatter(a[i+1]);
				if (del)
					remove(i,i+1);
			}

		if (errout != null)
			errout.println(x+" = "+ res);

		return res;
	}

	public void setPrintStream(PrintStream p)
	{
		errout = p;
	}

// Private data and methods.

	private String[] a = null;
	private PrintStream errout = null;
}
