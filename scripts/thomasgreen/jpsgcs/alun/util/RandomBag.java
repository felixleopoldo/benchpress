package jpsgcs.alun.util;

import java.util.Collection;
import java.util.ArrayList;

/**
 A RandomBag is a Collection of objects from which an object can
 be randomly selected either with replacement, using next(), or 
 without, using draw().
*/

public interface RandomBag<V> extends Collection<V>
{
/** 
 Selects a random element from the bag but does not change the contents 
 of the bag.
 Returns null if the bag is empty.
*/
	public V next();

/**
 Selects and removes a random element from the bag.
 Returns null if the bag is empty.
*/
	public V draw();
}
