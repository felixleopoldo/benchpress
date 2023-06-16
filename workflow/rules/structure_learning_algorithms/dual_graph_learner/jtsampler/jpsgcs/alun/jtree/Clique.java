package jpsgcs.alun.jtree;

import jpsgcs.alun.hashing.RandomIdentitySet;
import jpsgcs.alun.util.AlphaSet;
import java.util.Collection;
import java.util.Random;

public class Clique<V> extends RandomIdentitySet<V>
{
	public Clique(Random r)
	{
		super(r);
	}

	public Clique(Collection<V> x)
	{
		this(x,null);
	}

	public Clique(Collection<V> x, Random r)
	{
		super(x,r);
	}

	public Clique(V x)
	{
		super(x);
	}

	public String toString()
	{
		return new AlphaSet<V>(this).toString();
	}
}
