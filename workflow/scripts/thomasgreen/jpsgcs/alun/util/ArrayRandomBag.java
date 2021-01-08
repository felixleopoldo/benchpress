package jpsgcs.alun.util;

import java.util.Collection;
import java.util.ArrayList;
import java.util.Set;
import java.util.Random;

/**
 A RandomBag is a Collection of objects from which an object can
 be randomly selected either with replacement, using next(), or 
 without, using draw().
*/

public class ArrayRandomBag<V> extends ArrayList<V> implements RandomBag<V>
{
	private Random rand = null;

/**
 Constructs a new empty ArrayRandomBag.
*/
	public ArrayRandomBag(Random r)
	{
		super();
		rand = r;
	}
 
/**
 Constructs a new ArrayRandomBag containing the elements of the given
 Collection.
*/
	public ArrayRandomBag(Random r, Collection<? extends V> c)
	{
		super(c);
		rand = r;
	}

/** 
 Selects a random element from the bag but does not change the contents 
 of the bag.
 Returns null if the bag is empty.
*/
	public V next()
	{
		if (isEmpty())
			return null;
		else
			return get( (int) (rand.nextDouble() * size()) );
	}

/**
 Selects and removes a random element from the bag.
 Returns null if the bag is empty.
*/
	public V draw()
	{
		if (isEmpty())
			return null;
		else
			return remove( (int) (rand.nextDouble() * size()) );
	}
}
