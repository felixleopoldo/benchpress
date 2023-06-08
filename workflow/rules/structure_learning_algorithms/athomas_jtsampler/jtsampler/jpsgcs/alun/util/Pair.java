package jpsgcs.alun.util;

/**
 A holder for a pair of objects.
*/
public class Pair<E,F>
{
/**
 Creates a new null pair.
*/
	public Pair()
	{
	}

/**
 Creates a new pair for the given two objects.
*/
	public Pair(E a, F b)
	{
		x = a;
		y = b;
	}

/**
 Returns the object specified first in the construtor.
*/
	public E getX()
	{
		return x;
	}

/** 
 Returns the object specified second in the constructor.
*/
	public F getY()
	{
		return y;
	}

/** 
 Returns a string representation of the pair.
*/
	public String toString()
	{
		return x + " " + y;
	}

/**
 The objects are directly accessible.
*/
	public E x = null;
	public F y = null;
}
