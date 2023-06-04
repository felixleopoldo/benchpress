package jpsgcs.alun.util;

import java.util.Set;
import java.util.TreeSet;
import java.util.Collection;
import java.util.Iterator;

public class SortableSet<V extends Comparable> extends TreeSet<V> implements Comparable<SortableSet<V>>
{
	public SortableSet()
	{
		super();
	}

	public SortableSet(Collection<? extends V> c)
	{
		super(c);
	}

	public int compareTo(SortableSet<V> s)
	{
		if (size() < s.size())
			return -1;
		if (size() > s.size())
			return 1;

		Iterator<V> i = iterator();
		Iterator<V> j = new TreeSet<V>(s).iterator();

		while (true)
		{
			if (i.hasNext())
			{
				if (j.hasNext())
				{
					V vi = i.next();
					V vj = j.next();
			
					int k = vi.compareTo(vj);

					if (k == 0)
						continue;
	
					return k;
				}
				else
				{
					return 1;
				}
			}
			else
			{
				if (j.hasNext())
				{
					return -1;
				}
				else
				{
					return 0;
				}
			}
		}
	}
}
