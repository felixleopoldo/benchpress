package jpsgcs.alun.jtree;

import jpsgcs.alun.util.Pair;
import jpsgcs.alun.util.DoubleValue;
import java.util.Map;
import java.util.LinkedHashMap;
import java.util.Set;
import java.util.LinkedHashSet;

public class UniformDecomposable<V> extends OnePairSampler<V> 
{
	public UniformDecomposable(JTree<V> jtree)
	{
		this(jtree,null);
	}
	
	public UniformDecomposable(JTree<V> jtree, WSMGraphLaw<V> cs)
	{
		super(jtree,cs,true);
	}
}
