package jpsgcs.alun.util;

import java.io.PrintStream;

public class Monitor
{
	private static Runtime r = null;
	private static double start = 0;
	private static double curtime = 0;
	private static double mb = 1024*1024;
	private static boolean quiet = false;

	static
	{
		restart();
		r = Runtime.getRuntime();
	}

	public static void quiet(boolean b)
	{
		quiet = b;
	}

	public static void show()
	{
		show("Usage: ",System.err);
	}

	public static void show(String s)
	{
		show(s,System.err);
	}

	public static void restart()
	{
		start = System.currentTimeMillis()/1000.0;
		curtime = start;
	}

	public static double time()
	{
		double time = System.currentTimeMillis()/1000.0;
		return time -start;
	}

	public static void show(String s, PrintStream ps)
	{
		show(s,ps,false);
	}

	public static void show(String s, PrintStream ps, boolean memory)
	{
		if (quiet)
			return;

		double time = System.currentTimeMillis()/1000.0;
		ps.printf("%s %10.3f s\t%10.3f s",s,(time-curtime),(time-start));
		curtime = time;

		if (memory)
		{
			double store = 0;

			store = ( r.totalMemory() - r.freeMemory() ) / mb;
			ps.printf("\t%10.3f Mb\t",store);

			store = r.freeMemory()/mb;
			ps.printf("%10.3f Mb\t",store);
		}

		ps.println();
	}
}
