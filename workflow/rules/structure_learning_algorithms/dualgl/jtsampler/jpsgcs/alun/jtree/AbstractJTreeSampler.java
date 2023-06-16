package jpsgcs.alun.jtree;

import jpsgcs.alun.hashing.RandomIdentitySet;
import jpsgcs.alun.util.Pair;

import java.util.Collection;
import java.util.Set;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;

abstract public class AbstractJTreeSampler<V> extends JTreeSampler<V>
{
	public AbstractJTreeSampler(V s, JTree<V> jtree, WSMGraphLaw<V> scorer)
	{
		super(s,jtree,scorer);
	}

	public AbstractJTreeSampler(JTree<V> jtree, WSMGraphLaw<V> scorer)
	{
		super(jtree,scorer);
	}

	protected Clique<V> connect(V x, V y, Clique<V> Cx, Clique<V> Cy, Separator<V> S)
	{
		Clique<V> Cxy = null;

		if (Cx.size() == S.size() + 1)
		{
			if (Cy.size() == S.size() + 1)
			{
				Cxy = new Clique<V>(S,random());
				Cxy.add(x);
				Cxy.add(y);
				jt.add(Cxy);
				
				jt.disconnect(Cx,Cy);

				Collection<Clique<V>> neighbs = new LinkedHashSet<Clique<V>>(jt.getNeighbours(Cx));
				for (Clique<V> N : neighbs)
				{
					Separator<V> Sn = jt.connection(Cx,N);
					jt.disconnect(Cx,N);
					Sn.setX(Cxy);
					Sn.setY(N);
					jt.connect(Cxy,N,Sn);
				}
				jt.remove(Cx);

				neighbs = new LinkedHashSet<Clique<V>>(jt.getNeighbours(Cy));
				for (Clique<V> N : neighbs)
				{
					Separator<V> Sn = jt.connection(Cy,N);
					jt.disconnect(Cy,N);
					Sn.setX(Cxy);
					Sn.setY(N);
					jt.connect(Cxy,N,Sn);
				}
				jt.remove(Cy);
			}
			else
			{
				Cxy = Cx;
				Cxy.add(y);
				S.add(y);
			}
		}
		else
		{
			if (Cy.size() == S.size() + 1)
			{
				Cxy = Cy;
				Cxy.add(x);
				S.add(x);
			}
			else
			{
				Cxy = new Clique<V>(S,random());
				Cxy.add(x);
				Cxy.add(y);
				jt.disconnect(Cx,Cy);
				jt.connect(Cx,Cxy,new Separator<V>(Cx,Cxy,random()));
				jt.connect(Cy,Cxy,new Separator<V>(Cy,Cxy,random()));
			}
		}

		jt.graph().connect(x,y);

		return Cxy;
	}

	protected Clique<V> arbitraryChoice(Clique<V> P, Clique<V> Cxy, Clique<V> Cx, Clique<V> Cy)
	{
		return random().nextDouble() < 0.5 ? Cx : Cy;
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
				int i = 0;
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
						Clique<V> R = arbitraryChoice(P,Cxy,Cx,Cy);
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
			}
		}
		else
		{
			if (Cy == null)
			{
				Cy = Cxy;
				jt.connection(Cx,Cy).remove(x);
				Cy.remove(x);
			}
			else
			{
				jt.disconnect(Cx,Cxy);
				jt.disconnect(Cy,Cxy);
				jt.remove(Cxy);
				jt.connect(Cx,Cy,new Separator<V>(Cx,Cy,random()));
			}
		}

		jt.graph().disconnect(x,y);

		return jt.connection(Cx,Cy);
	}
}
