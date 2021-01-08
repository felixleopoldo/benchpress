package jpsgcs.alun.util;

/**
 A wrapper around a modifiable int value.
*/

public class IntValue implements Comparable<IntValue>
{
        public int i = 0;

	public IntValue()
	{
	}

        public IntValue(int j)
        {
                i = j;
        }

	public void add(int x)
	{
		i = i+x;
	}

	public int value()
	{
		return i;
	}

        public final int compareTo(IntValue x)
        {
                return ( i<x.i ? -1 : ( i>x.i ? 1 : 0 ) );
        }

        public final int hashCode()
        {
                return i;
        }

        public final boolean equals(Object o)
        {
                return o instanceof IntValue && ((IntValue)o).i == i;
        }

        public String toString()
        {
                return i+"";
        }
}
