package jpsgcs.alun.jtree;

import jpsgcs.alun.util.RandomBag;
import jpsgcs.alun.util.Pair;
import jpsgcs.alun.util.ArrayRandomBag;
import jpsgcs.alun.graph.Graph;

import java.util.Collection;
import java.util.Set;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.LinkedHashMap;

public class GiudiciGreen<V> extends AbstractJTreeSampler<V>
{
	
	private Graph<V,Object> sub = null;
	private Graph<V,Object> sup = null;
	
	public GiudiciGreen(JTree<V> jtree, WSMGraphLaw<V> cs, Graph<V,Object> lo, Graph<V,Object> hi)
	{
		this(jtree,cs);
		sub = lo;
		sup = hi;
	}

	public GiudiciGreen(JTree<V> jtree, WSMGraphLaw<V> cs)
	{
		super(jtree,cs);

		bag = new ArrayRandomBag<V>(random(),jt.graph().getVertices());

		map = new LinkedHashMap<V,Clique<V>>();
		for (Clique<V> c : jt.cliques)
			for (V v : c)
				map.put(v,c);
	}

	public GiudiciGreen(V sink, JTree<V> jtree, WSMGraphLaw<V> cs, Graph<V,Object> lo,  Graph<V,Object> hi)
	{
		this(sink,jtree,cs);
		sub = lo;
		sup = hi;
	}

	public GiudiciGreen(V sink, JTree<V> jtree, WSMGraphLaw<V> cs)
	{
		this(jtree,cs);
		bag.remove(sink);
	}

	public GiudiciGreen(JTree<V> jtree, Graph<V,Object> lo, Graph<V,Object> hi)
	{
		this(jtree);
		sub = lo;
		sup = hi;
	}

	public GiudiciGreen(JTree<V> jtree)
	{
		this(jtree,null);
	}

	public UpdateResult randomUpdate()
	{
		double U = random().nextDouble();

		if (U <= 0.5)
			return randomDisconnection();
		if (U <= 1.0)
			return randomConnection();

		return null;
	}

	public UpdateResult randomDisconnection()
	{
		UpdateInfo<V> up = new UpdateInfo<V>();
		
		if (!chooseRandomPair(up) || !testDisconnection(up))
			//return up.errcode;
			return new UpdateResult(up.errcode);
		
		double delta = deltaScore(up.Cxy,up.x,up.y,up.type);

		//if (Math.log(random().nextDouble()) * getTemperature() > deltaScore(up.Cxy,up.x,up.y,up.type))
		if (Math.log(random().nextDouble()) * getTemperature() > delta)
			//return 4;
			return new UpdateResult(4, -1, up.x, up.y, delta, up.Cxy.size());

        int csize = up.Cxy.size();
		Separator<V> S = disconnect(up.x,up.y,up.Cx,up.Cy,up.Cxy);

		for (V v : S.getX())
			map.put(v,S.getX());
		for (V v : S.getY())
			map.put(v,S.getY());

		//return 0;
		return new UpdateResult(0,-1,up.x,up.y, delta, csize);
	}

/*
	public int randomDisCon()
	{
		UpdateInfo<V> dis = new UpdateInfo<V>();

		if (!chooseRandomPair(dis) || !testDisconnection(dis))
			return dis.errcode;

		double logprob = deltaScore(dis.Cxy,dis.x,dis.y,dis.type);

		dis.S = disconnect(dis.x,dis.y,dis.Cx,dis.Cy,dis.Cxy);
		for (V v : dis.S.getX())
			map.put(v,dis.S.getX());
		for (V v : dis.S.getY())
			map.put(v,dis.S.getY());

		UpdateInfo<V> con = new UpdateInfo<V>();

		if (!chooseRandomPair(con) || !testConnection(con))
		{
			testConnection(dis);
 			Pair<Clique<V>,Clique<V>> p = jt.cliquePair(dis.x,dis.y,dis.S);
			dis.Cxy = connect(dis.x,dis.y,p.x,p.y,dis.S);
			for (V v : dis.Cxy)
				map.put(v,dis.Cxy);
			return con.errcode;
		}

		logprob += deltaScore(con.S,con.x,con.y,con.type);

		if (Math.log(random().nextDouble()) * getTemperature() > logprob)
		{
			testConnection(dis);
 			Pair<Clique<V>,Clique<V>> p = jt.cliquePair(dis.x,dis.y,dis.S);
			dis.Cxy = connect(dis.x,dis.y,p.x,p.y,dis.S);
			for (V v : dis.Cxy)
				map.put(v,dis.Cxy);
			return 6;
		}
		
 		Pair<Clique<V>,Clique<V>> p = jt.cliquePair(con.x,con.y,con.S);
		con.Cxy = connect(con.x,con.y,p.x,p.y,con.S);
		for (V v : con.Cxy)
			map.put(v,con.Cxy);

		return 0;
	}

	public int randomConDis()
	{
		UpdateInfo<V> con = new UpdateInfo<V>();

		if (!chooseRandomPair(con) || !testConnection(con))
			return con.errcode;

		double logprob = deltaScore(con.S,con.x,con.y,con.type);

 		Pair<Clique<V>,Clique<V>> p = jt.cliquePair(con.x,con.y,con.S);
		con.Cxy = connect(con.x,con.y,p.x,p.y,con.S);
		for (V v : con.Cxy)
			map.put(v,con.Cxy);

		
		UpdateInfo<V> dis = new UpdateInfo<V>();
		if (!chooseRandomPair(dis) || !testDisconnection(dis))
		{
			testDisconnection(con);
			con.S = disconnect(con.x,con.y,con.Cx,con.Cy,con.Cxy);
			for (V v : con.S.getX())
				map.put(v,con.S.getX());
			for (V v : con.S.getY())
				map.put(v,con.S.getY());
			return dis.errcode;
		}

		logprob += deltaScore(dis.Cxy,dis.x,dis.y,dis.type);

		if (Math.log(random().nextDouble()) * getTemperature() > logprob)
		{
			testDisconnection(con);
			con.S = disconnect(con.x,con.y,con.Cx,con.Cy,con.Cxy);
			for (V v : con.S.getX())
				map.put(v,con.S.getX());
			for (V v : con.S.getY())
				map.put(v,con.S.getY());
			return 6; 
		}
		
		dis.S = disconnect(dis.x,dis.y,dis.Cx,dis.Cy,dis.Cxy);
		for (V v : dis.S.getX())
			map.put(v,dis.S.getX());
		for (V v : dis.S.getY())
			map.put(v,dis.S.getY());

		return 0;
	}
*/

	public UpdateResult randomConnection()
	{
		UpdateInfo<V> up = new UpdateInfo<V>();

		if (!chooseRandomPair(up) || !testConnection(up))
			//return up.errcode;
			return new UpdateResult(up.errcode);

		double delta = deltaScore(up.S,up.x,up.y,up.type);
		if (Math.log(random().nextDouble()) * getTemperature() > delta)
			//return 6;
			return new UpdateResult(6, 1, up.x, up.y, delta, up.S.size() + 2);

        int csize = up.S.size()+2;
 		Pair<Clique<V>,Clique<V>> p = jt.cliquePair(up.x,up.y,up.S);
		Clique<V> Cxy = connect(up.x,up.y,p.x,p.y,up.S);

		for (V v : Cxy)
			map.put(v,Cxy);

		//return 0;
		return new UpdateResult(0,1,up.x,up.y, delta, csize);
	}

	public V randomVertex()
	{
		return bag.sample();
	}

	public void randomize()
	{
	}

	public boolean testDisconnection(UpdateInfo<V> up)
	{
		// Make sure any subgraph doesn't contain the vertices to be disconnected.
		if (sub != null && sub.connects(up.x,up.y))
		{
			up.errcode = 2;
			return false;
		}

		Set<Clique<V>> Tx = new LinkedHashSet<Clique<V>>();
		jt.collect(Tx,map.get(up.x),up.x);

		Set<Clique<V>> Ty = new LinkedHashSet<Clique<V>>();
		jt.collect(Ty,map.get(up.y),up.y);
	
		Set<Clique<V>> t = new LinkedHashSet<Clique<V>>();
		t.addAll(Tx);
		t.retainAll(Ty);

		if (t.size() > 1)
		{
			up.errcode = 2;
			return false;
		}

		if (t.size() == 0)
		{
			up.errcode = 3;
			return false;
		}

		up.Cxy = t.iterator().next();

		Pair<Clique<V>,Clique<V>> p = jt.cliquePair(up.x,up.y,up.Cxy);
		up.Cx = p.x;
		up.Cy = p.y;

		up.type = -1;

		if (up.Cx == null)
		{
			if (up.Cy == null)
				up.type = 0;
			else
				up.type = 2;
		}
		else
		{
			if (up.Cy == null)
				up.type = 1;
			else
				up.type = 3;
		}

		return true;
	}

	public boolean testConnection(UpdateInfo<V> up)
	{
		// Make sure any supergraph contains the vertices to be connected.
		if (sup != null && !sup.connects(up.x,up.y))
		{
			up.errcode = 2;
			return false;
		}

		Set<Clique<V>> Tx = new LinkedHashSet<Clique<V>>();
		jt.collect(Tx,map.get(up.x),up.x);

		Set<Clique<V>> Ty = new LinkedHashSet<Clique<V>>();
		jt.collect(Ty,map.get(up.y),up.y);

		Set<Clique<V>> t = new LinkedHashSet<Clique<V>>();
		t.addAll(Tx);
		t.retainAll(Ty);

		if (t.size() > 1)
		{
			up.errcode = 2;
			return false;
		}

		if (t.size() == 1)
		{
			up.errcode = 3;
			return false;
		}

		Set<V> S = null;
		up.Cx = null;
		up.Cy = null;
		for (Clique<V> cx : Tx)
			for (Clique<V> cy : Ty)
			{
				Set<V> s = new LinkedHashSet<V>();
				s.addAll(cx);
				s.retainAll(cy);
				if (S == null || s.size() > S.size())
				{
					S = s;
					up.Cx = cx;
					up.Cy = cy;
				}
			}

		Set<Clique<V>> Ts = new LinkedHashSet<Clique<V>>();
		jt.collect(Ts,up.Cx,S);
		if (!Ts.contains(up.Cy))
		{
			up.errcode = 4;
			return false;
		}

		up.S = null;
		for (Separator<V> s : jt.path(up.Cx,up.Cy,Ts))
			if (S.containsAll(s))
			{
				up.S = s;
				jt.disconnect(up.S.getX(),up.S.getY());
				up.S.setX(up.Cx);
				up.S.setY(up.Cy);
				jt.connect(up.Cx,up.Cy,up.S);
				break;
			}

		if (up.S == null)
		{
			up.errcode = 5;
			return false;
		}

		up.type = -1;
		if (up.Cx.size() == S.size() +1 )
		{
			if (up.Cy.size() == S.size() + 1)
				up.type = 0;
			else
				up.type = 2;
		}
		else
		{
			if (up.Cy.size() == S.size() + 1)
				up.type = 1;
			else
				up.type = 3;
		}

		return true;
	}

// Private data and methods.

	protected RandomBag<V> bag = null;
	protected Map<V,Clique<V>> map = null;

	private boolean chooseRandomPair(UpdateInfo<V> up)
	{
		if (bag.size() < 2)
		{
			up.errcode = 1;
			return false;
		}

		up.x = bag.sample();
		do
		{
			up.y = bag.sample();
		}
		while (up.y == up.x);

		return true;
	}

	protected Separator<V> disconnect(V x, V y, Clique<V> Cx, Clique<V> Cy, Clique<V> Cxy)
	{
		if (Cx == null)
		{
			if (Cy == null)
			{
				Cx = new Clique<V>(Cxy,random());
				Cx.remove(y);
				Cy = new Clique<V>(Cxy,random());
				Cy.remove(x);

				jt.connect(Cx,Cy,new Separator<V>(Cx,Cy,random()));

				Set<Clique<V>> Nxy = new LinkedHashSet<Clique<V>>(jt.getNeighbours(Cxy));
				for (Clique<V> P : Nxy)
				{
					if (P.contains(x))
					{
						Separator<V> Q = jt.connection(P,Cxy);
						jt.disconnect(P,Cxy);
						Q.setX(P);
						Q.setY(Cx);
						jt.connect(P,Cx,Q);
					}
					else if (P.contains(y))
					{
						Separator<V> Q = jt.connection(P,Cxy);
						jt.disconnect(P,Cxy);
						Q.setX(P);
						Q.setY(Cy);
						jt.connect(P,Cy,Q);
					}
					else
					{
						Separator<V> Q = jt.connection(P,Cxy);
						jt.disconnect(P,Cxy);
						Clique<V> R = ( random().nextDouble() < 0.5 ? Cx : Cy );
						Q.setX(P);
						Q.setY(R);
						jt.connect(P,R,Q);
					}
				}
				jt.remove(Cxy);
			}
			else
			{
				Cx = Cxy;
				jt.connection(Cy,Cx).remove(y);
				Cx.remove(y);
				Collection<Clique<V>> neighbs = new LinkedHashSet<Clique<V>>(jt.getNeighbours(Cx));
				for (Clique<V> N : neighbs)
					if (N != Cy && N.contains(y))
					{
						Separator<V> Sn = jt.connection(N,Cx);
						jt.disconnect(N,Cx);
						Sn.setX(N);
						Sn.setY(Cy);
						jt.connect(N,Cy,Sn);
					}
			}
		}
		else
		{
			if (Cy == null)
			{
				Cy = Cxy;
				jt.connection(Cx,Cy).remove(x);
				Cy.remove(x);
				Collection<Clique<V>> neighbs = new LinkedHashSet<Clique<V>>(jt.getNeighbours(Cy));
				for (Clique<V> N : neighbs)
					if (N != Cx && N.contains(x))
					{
						Separator<V> Sn = jt.connection(N,Cy);
						jt.disconnect(N,Cy);
						Sn.setX(N);
						Sn.setY(Cx);
						jt.connect(N,Cx,Sn);
					}
			}
			else
			{
				jt.disconnect(Cx,Cxy);
				jt.disconnect(Cy,Cxy);
				jt.connect(Cx,Cy,new Separator<V>(Cx,Cy,random()));

				Set<Clique<V>> Nxy = new LinkedHashSet<Clique<V>>(jt.getNeighbours(Cxy));
				for (Clique<V> P : Nxy)
				{
					if (P.contains(x))
					{
						Separator<V> Q = jt.connection(P,Cxy);
						jt.disconnect(P,Cxy);
						Q.setX(P);
						Q.setY(Cx);
						jt.connect(P,Cx,Q);
					}
					else if (P.contains(y))
					{
						Separator<V> Q = jt.connection(P,Cxy);
						jt.disconnect(P,Cxy);
						Q.setX(P);
						Q.setY(Cy);
						jt.connect(P,Cy,Q);
					}
					else
					{
						Separator<V> Q = jt.connection(P,Cxy);
						jt.disconnect(P,Cxy);
						Clique<V> R = ( random().nextDouble() < 0.5 ? Cx : Cy );
						Q.setX(P);
						Q.setY(R);
						jt.connect(P,R,Q);
					}
				}

				jt.remove(Cxy);
			}
		}

		jt.graph().disconnect(x,y);

		return jt.connection(Cx,Cy);
	}
}
