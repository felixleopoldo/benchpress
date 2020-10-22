package jpsgcs.alun.jtree;

import jpsgcs.alun.util.RandomBag;
import jpsgcs.alun.util.Pair;
import jpsgcs.alun.util.ArrayRandomBag;
import java.util.Collection;
import java.util.Set;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.LinkedHashMap;

public class ParticleGibbs<V> extends AbstractJTreeSampler<V>
{

    public ParticleGibbs(JTree<V> jtree, WSMGraphLaw<V> cs)
    {
        super(jtree,cs);

        //bag = new ArrayRandomBag<V>(random(),jt.graph().getVertices());
        //map = new LinkedHashMap<V,Clique<V>>();
        //for (Clique<V> c : jt.cliques)
        //    for (V v : c)
        //        map.put(v,c);
    }

    public ParticleGibbs(JTree<V> jtree)
    {
        this(jtree,null);
    }

    public int randomDisconnection(){
        return 0;
    }

    public int randomConnection(){
        return 0;
    }

    public int randomUpdate()
    {
        return 0;
    }
}
