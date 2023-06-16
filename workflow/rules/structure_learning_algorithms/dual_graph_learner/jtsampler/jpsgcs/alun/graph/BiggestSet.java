package jpsgcs.alun.graph;

import java.util.Set;
import java.util.Comparator;

public class BiggestSet implements Comparator<Set>
{
	public int compare(Set x, Set y)
	{
		return ( x.size() < y.size() ? 1 : ( x.size() > y.size() ? -1 : 0 ) );
	}

	public boolean equals(Object obj)
	{
		return obj == this;
	}
}
