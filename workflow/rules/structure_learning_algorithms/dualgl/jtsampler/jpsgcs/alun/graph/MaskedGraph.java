package jpsgcs.alun.graph;

import java.util.Collection;

public interface MaskedGraph<V,E> extends Graph<V,E>
{
	public void show(V v);
	public void hide(V v);
	public void show(Collection<V> c);
	public void hide(Collection<V> c);
	public Graph<V,E> completeGraph();
}
