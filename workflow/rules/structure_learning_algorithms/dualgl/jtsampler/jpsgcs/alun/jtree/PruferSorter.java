package jpsgcs.alun.jtree;

import jpsgcs.alun.util.IntValue;
import jpsgcs.alun.util.Pair;
import java.util.Collection;
import java.util.Set;
import java.util.LinkedList;
import java.util.Map;
import java.util.LinkedHashMap;

public class PruferSorter<V>
{
	public PruferSorter(Collection<V> x, Collection<V> y)
	{
/*
		if (x.size() + 2 != y.size()) 
			throw new RuntimeException("Prufer data missmatch. List sizes don't match."); 

		if (!y.containsAll(x))
			throw new RuntimeException("Prufer data missmatch. Random list not contained in vertex set."); 
*/
			
		w = new LinkedList<V>(x);

		h = new LinkedHashMap<V,IntValue>();
		for (V z : y)
			h.put(z,new IntValue());
		
		for (V z : w)
			h.get(z).add(1);

		v = new LinkedList<V>();
		for (V z : y)
			if (h.get(z).value() == 0)
				v.add(z);
	}

	public boolean hasNext()
	{
		return !v.isEmpty();
	}

	public Pair<V,V> next()
	{
		if (v.isEmpty())
			return null;

		if (w.isEmpty())
			return new Pair<V,V>(v.remove(),v.remove());

		V x = v.remove();
		V y = w.remove();

		h.get(y).add(-1);
		if (h.get(y).value() == 0)
			v.add(y);

		return new Pair<V,V>(x,y);
	}

	private LinkedList<V> w = null;
	private LinkedList<V> v = null;
	private Map<V,IntValue> h = null;
}
