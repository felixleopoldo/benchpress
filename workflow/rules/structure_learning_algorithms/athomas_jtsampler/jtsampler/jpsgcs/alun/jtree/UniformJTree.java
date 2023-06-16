package jpsgcs.alun.jtree;

import java.util.Collection;
import java.util.Set;
import java.util.LinkedHashSet;

public class UniformJTree<V> extends OnePairSampler<V>
{
	public UniformJTree(JTree<V> jt)
	{
		this(jt,null);
	}

	public UniformJTree(JTree<V> jt, WSMGraphLaw<V> cs)
	{
		super(jt,cs,false);
	}
}
