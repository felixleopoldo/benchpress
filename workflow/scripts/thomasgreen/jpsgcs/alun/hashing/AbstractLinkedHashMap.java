package jpsgcs.alun.hashing;

import java.util.Collection;
import java.util.AbstractCollection;
import java.util.Collections;
import java.util.Map;
import java.util.Set;
import java.util.AbstractSet;
import java.util.Iterator;
import java.util.Random;

abstract public class AbstractLinkedHashMap<K,V> implements Map<K,V>
{
	abstract protected int hash(Object o);

	abstract protected boolean myequals(Object a, Object b);

// Private classes.

	private class Entry<K,V> implements Map.Entry<K,V>
	{
		private Entry<K,V> hprev = null;
		private Entry<K,V> hnext = null;

		private Entry<K,V> lprev = null;
		private Entry<K,V> lnext = null;

		private K key = null;
		private V val = null;
		
		public Entry(K k, V v)
		{	
			key = k;
			val = v;
		}

		public boolean equals(Object o)
		{
			if (!(o instanceof Map.Entry))
				return false;
			Map.Entry e = (Map.Entry) o;
			return myequals(key,e.getKey()) && myequals(val,e.getValue());
		}

		public int hashCode()
		{
			return hash(key) ^ hash(val);
		}

		public V setValue(V v)
		{
			V old = val;
			val = v;
			return old;
		}

		public K getKey()
		{
			return key;
		}

		public V getValue()
		{
			return val;
		}

		public Entry<K,V> lnext()
		{
			return lnext;
		}

		public Entry<K,V> lprev()
		{
			return lprev;
		}
	}

	private class KeySet extends AbstractSet<K>
	{
		public int size()
		{
			return size;
		}

		public Iterator<K> iterator()
		{
			return new KeyIterator();
		}

		public boolean contains(Object k)
		{
			return getEntry(hashOf(k),k) != null;
		}
	}
	
	private class KeyIterator implements Iterator<K>
	{
		private Entry<K,V> current = null;
		private Entry<K,V> previous = null;

		public KeyIterator()
		{
			current = head;
			previous = null;
		}

		public boolean hasNext()
		{
			return current != null;
		}

		public K next()
		{
			previous = current;
			current = current.lnext;
			return previous.key;
		}

		public void remove()
		{
		}
	}

	private class ValueCollection extends AbstractCollection<V>
	{	
		public int size()
		{
			return size;
		}

		public Iterator<V> iterator()
		{
			return new ValueIterator();
		}
	}

	private class ValueIterator implements Iterator<V>
	{
		private Entry<K,V> current = null;
		private Entry<K,V> previous = null;

		public ValueIterator()
		{
			current = head;
			previous = null;
		}

		public boolean hasNext()
		{
			return current != null;
		}

		public V next()
		{
			previous = current;
			current = current.lnext;
			return previous.val;
		}

		public void remove()
		{
		}
	}

	private class EntrySet extends AbstractSet<Map.Entry<K,V>>
	{
		public int size()
		{
			return size;
		}

		public Iterator<Map.Entry<K,V>> iterator()
		{
			return new EntryIterator();
		}

		public boolean add(Map.Entry<K,V> e)
		{
			if (contains(e))
			{
				return false;
			}
			else
			{
				put(e.getKey(),e.getValue());
				return true;
			}
		}

		public boolean contains(Object o)
		{
			if (!(o instanceof Map.Entry))
				return false;
			Map.Entry entry = (Map.Entry)o;
			Map.Entry get = getEntry(hashOf(entry.getKey()),entry.getKey());
			return myequals(get.getValue(),entry.getValue());
		}
	}

	private class EntryIterator implements Iterator<Map.Entry<K,V>>
	{
		private Entry<K,V> current = null;
		private Entry<K,V> previous = null;

		public EntryIterator()
		{
			current = head;
		}

		public boolean hasNext()
		{
			return current != null;
		}

		public Map.Entry<K,V> next()
		{
			previous = current;
			current = current.lnext;
			return previous;
		}

		public void remove()
		{
			if (previous != null)
				removeKey(previous.key);
		}
	}

// Class constants.

	public static final int default_cap = 16;
	public static final double default_load = 0.75;
	public static final int scale = 2;

// Random entry generators.

	public Map.Entry<K,V> randomLinkedEntry(Random rand)
	{
		int j = 0;
		double u = rand.nextDouble() * size;

		for (Entry<K,V> h = head; h != null; h = h.lnext)
			if (u <= ++j)
				return h;

		return null;
	}

	public Map.Entry<K,V> randomHashedEntry(Random rand)
	{
		if (size == 0)
			return null;

		int i = 0;
		int j = 0;
		double u = 0;

		do
		{
			i = (int) (rand.nextDouble() * e.length);
			j = occupancy(e[i]);
			u = rand.nextDouble() * maxocc;
		}
		while (u > j);

		j = 0;
		for (Entry<K,V> h = e[i]; h != null; h = h.hnext)
			if (u <= ++j)
				return h;

		return null;
	}

// Public methods to implement Map.

	public void clear()
	{
		threshold = (int) (cap * load);
		size = 0;
		maxocc = 0;
		head = null;
		tail = null;
		e = (Entry<K,V>[]) new Entry[cap];
		entrySet = new EntrySet();
		keySet = new KeySet();
		valueCollection = new ValueCollection();
	}

	public boolean containsKey(Object k)
	{
		return getEntry(hashOf(k),k) != null;
	}

	public boolean containsValue(Object v)
	{
		for (Entry<K,V> h = head; h != null; h = h.lnext)
			if (myequals(h.val,v))
				return true;
		return false;
	}

	public Set<Map.Entry<K,V>> entrySet()
	{
		return entrySet;
	}

	public boolean equals(Object o)
	{
		if (!(o instanceof Map))
			return false;
		return entrySet().equals(((Map)o).entrySet());
	}

	public V get(Object o)
	{
		Entry<K,V> e = getEntry(hashOf(o),o);
		return e == null ? null : e.val;
	}

	public int hashCode()
	{	
		return entrySet.hashCode();
	}

	public boolean isEmpty()
	{
		return size == 0;
	}

	public Set<K> keySet()
	{
		return Collections.unmodifiableSet(keySet);
	}

	public V put(K k, V v)
	{
		if (size >= threshold)
			resize();

		int i = hashOf(k);
		Entry<K,V> g = getEntry(i,k);

		if (g == null)
		{
			g = new Entry<K,V>(k,v);
			g.hnext = e[i];
			if (e[i] != null)
				e[i].hprev = g;
			e[i] = g;

			if (head == null)
			{
				head = tail = g;
			}
			else
			{
				g.lprev = tail;
				tail.lnext = g;
				tail = g;
			}
			
			size++;

			int occ = occupancy(e[i]);
			if (occ > maxocc)
				maxocc = occ;
			return null;
		}
		else
		{
			V oldv = g.val;
			g.val = v;
			return oldv;
		}
	}

	public void putAll(Map<? extends K, ? extends V> m)
	{
		for (Map.Entry<? extends K, ? extends V> e : m.entrySet())
			put(e.getKey(),e.getValue());
	}

	public V remove(Object o)
	{
		return removeKey(o);
	}

	public int size()
	{
		return size;
	}

	public Collection<V> values()
	{
		return Collections.unmodifiableCollection(valueCollection);
	}

// Additional methods to allow querying of structure as a list.

	public K next(Object k)
	{
		Entry <K,V> e = getEntry(hashOf(k),k);
		if (e != null)
			e = e.lnext();
		return e == null ? null : e.getKey();
	}
		
	public K prev(Object k)
	{
		Entry <K,V> e = getEntry(hashOf(k),k);
		if (e != null)
			e = e.lprev();
		return e == null ? null : e.getKey();
	}

	public K first()
	{
		return head == null ? null : head.getKey();
	}

	public K last()
	{
		return tail == null ? null : tail.getKey();
	}

/*
	public void add(K k)
	{
		put(k,null);
	}

	public boolean contains(Object k)
	{
		return containsKey(k);
	}
*/

// Private data and methods.

	private int cap = 0;
	private double load = 0;
	private int threshold = 0;
	private int size = 0;
	private int maxocc = 0;

	private Entry<K,V>[] e = null;
	private Entry<K,V> head = null;
	private Entry<K,V> tail = null;
	private Set<Map.Entry<K,V>> entrySet = null;
	private Set<K> keySet = null;
	private Collection<V> valueCollection = null;

	private int hashOf(Object k)
	{
		int x = hash(k) % cap;
		if (x < 0)
			x += cap;
		return x;
		//return hash(k) % cap;
	}

	private Entry<K,V> getEntry(int i, Object k)
	{
		for (Entry<K,V> h = e[i]; h != null; h = h.hnext)
			if (myequals(h.key,k))
				return h;
		return null;
	}

	private V removeKey(Object o)
	{
		K k = (K) o;
		int i = hashOf(k);
		Entry<K,V> g = getEntry(i,k);
		if (g == null)
		{
			return null;
		}
		else
		{
			disconnect(i,g);
			size--;

			int occ = occupancy(e[i]);
			if (occ+1 == maxocc)
			{
				maxocc = 0;
				for (int j = 0; j<e.length; j++)
				{
					occ = occupancy(e[j]);
					if (occ > maxocc)
						maxocc = occ;
				}
			}

			return g.val;
		}
	}

	private void disconnect(int i, Entry<K,V> g)
	{
		if (e[i] == g)
			e[i] = g.hnext;
		if (g.hprev != null)
			g.hprev.hnext = g.hnext;
		if (g.hnext != null)
			g.hnext.hprev = g.hprev;
		g.hnext = null;
		g.hprev = null;

		if (head == g)
			head = g.lnext;
		if (tail == g)
			tail = g.lprev;
		if (g.lprev != null)
			g.lprev.lnext = g.lnext;
		if (g.lnext !=  null)
			g.lnext.lprev = g.lprev;
		g.lprev = null;
		g.lnext = null;
	}

	private void resize()
	{
		Entry<K,V> h = head;

		cap *= scale;
		clear();
		for ( ; h != null; h = h.lnext)
			put(h.key,h.val);
	}

	private int occupancy(Entry n)
	{
		int x = 0;
		for (Entry h = n; h != null; h = h.hnext)
			x++;
		return x;
	}

	protected void set(int c, double l)
	{
		cap = c;
		load = l;
	}
}
