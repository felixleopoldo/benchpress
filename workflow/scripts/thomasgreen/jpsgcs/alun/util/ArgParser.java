package jpsgcs.alun.util;

import java.io.PrintStream;
import java.io.InputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.FileNotFoundException;

public class ArgParser
{
	private String[] a = null;
	private PrintStream errout = null;

	public ArgParser(String[] args)
	{
		a = args;
	}

	public void setPrintStream(PrintStream p)
	{
		errout = p;
	}

	public boolean gotOpt(String x)
	{
		boolean res = false;

		for (String y : a)
			if (y.equals(x))
				res = true;

		if (errout != null)
			errout.println("Got "+x+" = "+res);

		return res;
	}

	public String stringAfter(String x, String defval)
	{
		String res = defval;

		for (int i=0; i<a.length; i++)
			if (a[i].equals(x))
				res = a[i+1];

		if (errout != null)
			errout.println(x+" = "+ res);
		
		return res;
	}

	public int intAfter(String x, int defval)
	{
		int res = defval;

		for (int i=0; i<a.length; i++)
			if (a[i].equals(x))
				res = new Integer(a[i+1]).intValue();

		if (errout != null)
			errout.println(x+" = "+ res);
		
		return res;
	}

	public double doubleAfter(String x, double defval)
	{
		double res = defval;

		for (int i=0; i<a.length; i++)
			if (a[i].equals(x))
				res = new Double(a[i+1]).doubleValue();

		if (errout != null)
			errout.println(x+" = "+ res);
		
		return res;
	}

	public InputStream inputStreamAfter(String x, InputStream defval) throws FileNotFoundException
	{
		InputStream res = defval;

		for (int i=0; i<a.length; i++)
			if (a[i].equals(x))
				res = new FileInputStream(a[i+1]);

		if (errout != null)
			errout.println(x+" = "+ res);

		return res;
	}

	public PrintStream printStreamAfter(String x, PrintStream defval) throws FileNotFoundException
	{
		PrintStream res = defval;

		for (int i=0; i<a.length; i++)
			if (a[i].equals(x))
				res = new PrintStream(new FileOutputStream(a[i+1]));

		if (errout != null)
			errout.println(x+" = "+ res);

		return res;
	}

	public InputFormatter inputFormatterAfter(String x, InputFormatter defval) throws IOException
	{
		InputFormatter res = defval;

		for (int i=0; i<a.length; i++)
			if (a[i].equals(x))
				res = new InputFormatter(a[i+1]);

		if (errout != null)
			errout.println(x+" = "+ res);

		return res;
	}
}
