package jpsgcs.alun.graph;

import java.util.Collection;

public interface LocatedGraph<V,E> extends Graph<V,E>
{
	public V find(double x, double y);
	public Coord getCoord(V v);
	public Collection<Coord> getCoords(Collection<V> c);
	public Collection<Coord> getCoords(V v);
	public Collection<Coord> getCoords();
}
