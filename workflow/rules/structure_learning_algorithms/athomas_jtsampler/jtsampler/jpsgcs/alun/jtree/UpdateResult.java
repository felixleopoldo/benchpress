package jpsgcs.alun.jtree;

import java.util.Set;

public class UpdateResult<V>
{
	public int code = -1;
    public double delta = 0.0;
	public V[][] cons = null;
	public V[][] diss = null;
    public int clique_size = 0;

	public UpdateResult(int c)
	{
		code = c;
	}

    public UpdateResult(int c,  V x, V y, double d, int m)
	{
		code = c;
        delta = d;
        clique_size = m;
		V[][] link = (V[][]) new Object[1][2];
		link[0][0] = x;
		link[0][1] = y;
		
	}
    
    public UpdateResult(int c, int type, V x, V y, double d, int m)
	{
		code = c;
        delta = d;
        clique_size = m;
		V[][] link = (V[][]) new Object[1][2];
		link[0][0] = x;
		link[0][1] = y;
		
		switch(type)
		{
		case 1: cons = link;
			break;
		case -1: diss = link;
			break;
		}
	}

    public UpdateResult(int type, V x, V y, double d)
	{
		code = 0;
        delta = d;
		V[][] link = (V[][]) new Object[1][2];
		link[0][0] = x;
		link[0][1] = y;
		
		switch(type)
		{
		case 1: cons = link;
			break;
		case -1: diss = link;
			break;
		}
	}

	public UpdateResult(int type, V x, V y)
	{
		code = 0;
		V[][] link = (V[][]) new Object[1][2];
		link[0][0] = x;
		link[0][1] = y;
		
		switch(type)
		{
		case 1: cons = link;
			break;
		case -1: diss = link;
			break;
		}
	}

	public UpdateResult(int type, Set<V> X, Set<V> Y)
	{
		code = 0;
		cons = (V[][]) new Object[0][0];
		diss = (V[][]) new Object[0][0];
		V[][] links = (V[][]) new Object[X.size()*Y.size()][2];
		int i = 0;
		for (V x : X)
			for (V y : Y)
			{	
				links[i][0] = x;
				links[i][1] = y;
				i++;
			}

		switch(type)
		{
		case 1: cons = links;
			break;
		case -1: diss = links;
			break;
		}		
	}

	public int getCode()
	{
		return code;
	}

    public double getDelta()
	{
		return delta;
	}

    public String toString()
	{
		return toString(false);
	}

	public String toString(boolean opt)
	{
		StringBuffer b = new StringBuffer();
//		b.append("("+code+")");
		b.append("[");
		if (cons != null && cons.length > 0)
		{
			for (int i=0; i<cons.length; i++)
				b.append(cons[i][0]+"-"+cons[i][1]+";");
			b.deleteCharAt(b.length()-1);
		}
		b.append("],");
		b.append("[");
		if (diss != null && diss.length > 0)
		{
			for (int i=0; i<diss.length; i++)
				b.append(diss[i][0]+"-"+diss[i][1]+";");
			b.deleteCharAt(b.length()-1);
		}
		b.append("]");

		if (opt)
			b.append(","+code+","+delta+","+clique_size);

		return b.toString();
	}
}
