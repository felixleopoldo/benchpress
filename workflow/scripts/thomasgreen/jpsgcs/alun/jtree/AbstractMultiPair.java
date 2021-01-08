package jpsgcs.alun.jtree;

import jpsgcs.alun.util.Pair;
import java.util.Set;
import java.util.LinkedHashSet;

abstract public class AbstractMultiPair<V> extends JTreeSampler<V>
{
	public AbstractMultiPair(V s, JTree<V> jtree, WSMGraphLaw<V> p, boolean ubydecom)
	{
		super(s,jtree,p);
		unifDecom = ubydecom;

		if (unifDecom)
			storedEnum = jt.logEnumerate();
	}

	public AbstractMultiPair(JTree<V> jtree, WSMGraphLaw<V> p, boolean ubydecom)
	{
		super(jtree,p);
		unifDecom = ubydecom;

		if (unifDecom)
			storedEnum = jt.logEnumerate();
	}

	private boolean unifDecom = false;
	private double storedEnum = 0;

	abstract public void chooseCon(Set<V> X, Set<V> Cx, Set<V> S);
	abstract public double pChooseCon(Set<V> X, Set<V> Cx, Set<V> S);
	abstract public void chooseDis(Set<V> X, Set<V> Y, Set<V> C);
	abstract protected double pChooseDis(Set<V> X, Set<V> Y, Set<V> C);

	public int proposeDisconnections(Set<V> X, Set<V> Y, Clique<V> Cx, Clique<V> Cy, Clique<V> C)
	{
		if (!unifDecom)
		{
			disconnect(X,Y,Cx,Cy,C);
			return 0;
		}

                Separator<V> Sxy = disconnect(X,Y,Cx,Cy,C);
                double newEnum = jt.logEnumerate();

                if (Math.log(random().nextDouble()) > storedEnum - newEnum)
                {
                        Pair<Clique<V>,Clique<V>> p = jt.cliquePair(X,Y,Sxy);
                        connect(X,Y,p.x,p.y,Sxy);
                        return 9;
                }

                storedEnum = newEnum;
                return 0;
	}

	public int proposeConnections(Set<V> X, Set<V> Y, Clique<V> Cx, Clique<V> Cy, Separator<V> S)
	{
		if (!unifDecom)
		{
			connect(X,Y,Cx,Cy,S);
			return 0;
		}

                Clique<V> Cxy = connect(X,Y,Cx,Cy,S);
                double newEnum = jt.logEnumerate();

                if (Math.log(random().nextDouble()) > storedEnum - newEnum)
                {
                        Pair<Clique<V>,Clique<V>> p = jt.cliquePair(X,Y,Cxy);
                        disconnect(X,Y,p.x,p.y,Cxy);
                        return 5;
                }

                storedEnum = newEnum;
                return 0;
	}

	public int randomConnection()
	{
		if (jt.separators.isEmpty())
			return 1;

		Separator<V> S = jt.separators.next();

		Clique<V> Cx = S.getX();
		Clique<V> X = new Clique<V>(random());
		chooseCon(X,Cx,S);

		Clique<V> Cy = S.getY();
		Clique<V> Y = new Clique<V>(random());
		chooseCon(Y,Cy,S);

		if (X.isEmpty())
			return 2;

		if (Y.isEmpty())
			return 3;

/* Handle sink for discrete variables.*/
		if (sink != null && (X.contains(sink) || Y.contains(sink)))
			return 9;

		double Aij = jt.separators.size() / pChooseCon(X,Cx,S) / pChooseCon(Y,Cy,S);

		Clique<V> C = new Clique<V>(random());
		C.addAll(S);
		C.addAll(X);
		C.addAll(Y);
		Aij *= pChooseDis(X,Y,C);

		int type = -1;

		if (Cx.size() == S.size() + X.size())
		{
			if (Cy.size() == S.size() + Y.size())
			{
				Aij /= (jt.cliques.size() - 1);

				int n = 0;
				for (Clique<V> P : jt.getNeighbours(Cx))
					if (P != Cy && disjoint(P,X))
						n++;

				for (Clique<V> P : jt.getNeighbours(Cy))
					if (P != Cx && disjoint(P,Y))
						n++;

				Aij *= Math.pow(0.5,n);

				type = 0;
			}
			else
			{
				Aij /= jt.cliques.size();

				type = 2;
			}
		}
		else
		{
			if (Cy.size() == S.size() + Y.size())
			{
				Aij /= jt.cliques.size();

				type = 1;
			}
			else
			{
				Aij /= (jt.cliques.size() + 1);

				type = 3;
			}
		}

		if (random().nextDouble() > Aij)
			return 4;

		if (Math.log(random().nextDouble()) * getTemperature() > deltaScore(S,X,Y,type))
			return 5;

		return proposeConnections(X,Y,Cx,Cy,S);
	}

	public int randomDisconnection()
	{
		if (jt.cliques.isEmpty())
			return 1;

		Clique<V> C = jt.cliques.next();

		if (C.size() < 2)
			return 2;

		Clique<V> X = new Clique<V>(random());
		Clique<V> Y = new Clique<V>(random());

		chooseDis(X,Y,C);

		if (X.isEmpty() || Y.isEmpty())
			return 3;

/* Handle sink for discrete variables.*/
		if (sink != null && (X.contains(sink) || Y.contains(sink)))
			return 9;

		Clique<V> S = new Clique<V>(random());
		S.addAll(C);
		S.removeAll(X);
		S.removeAll(Y);

		int n = 0;
		int nx = 0;
		int ny = 0;
		
		Clique<V> Cx = null;
		Clique<V> Cy = null;

		for (Clique<V> P : jt.getNeighbours(C))
		{
			if (!disjoint(P,X))
			{
				if (!disjoint(P,Y))
				{
					return 4;
				}
				else
				{
					nx++;
					if (P.containsAll(S) && P.containsAll(X))
						Cx = P;
				}
			}
			else
			{
				if (!disjoint(P,Y))
				{
					ny++;
					if (P.containsAll(S) && P.containsAll(Y))
						Cy = P;
				}
				else
				{
					n++;
				}
			}
		}

		double Aij = jt.cliques.size() / pChooseDis(X,Y,C);

		int type = -1;

		if (Cx == null)
		{
			if (Cy == null)
			{
				Aij /= (jt.separators.size() + 1);
				Aij /= Math.pow(0.5,n);

				C.removeAll(Y);
				Aij *= pChooseCon(X,C,S);
				C.addAll(Y);

				C.removeAll(X);
				Aij *= pChooseCon(Y,C,S);
				C.addAll(X);

				type = 0;
			}
			else
			{
				if (ny > 1)
					return 5;

				Aij /= jt.separators.size();

				C.removeAll(Y);
				Aij *= pChooseCon(X,C,S);
				C.addAll(Y);

				Aij *= pChooseCon(Y,Cy,S);

				type = 2;
			}
		}
		else
		{
			if (Cy == null)
			{
				if (nx > 1)
					return 6;

				Aij /= jt.separators.size(); 

				Aij *= pChooseCon(X,Cx,S);

				C.removeAll(X);
				Aij *= pChooseCon(Y,C,S);
				C.addAll(X);

				type = 1;
			}
			else
			{
				if (nx > 1 || ny > 1 || n > 0)
					return 7;

				Aij /= (jt.separators.size() - 1);

				Aij *= pChooseCon(X,Cx,S);

				Aij *= pChooseCon(Y,Cy,S);

				type = 3;
			}
		}

		if (random().nextDouble() > Aij)
			return 8;

		if (Math.log(random().nextDouble()) * getTemperature() > deltaScore(C,X,Y,type))
			return 9;

		return proposeDisconnections(X,Y,Cx,Cy,C);
	}

	private boolean disjoint(Set<V> a, Set<V> b)
	{
		for (V x : a)
			if (b.contains(x))
				return false;
		return true;
	}

	private Separator<V> disconnect(Set<V> X, Set<V> Y, Clique<V> Cx, Clique<V> Cy, Clique<V> C)
	{
		boolean[] pick = new boolean[jt.getNeighbours(C).size()];
		for (int i=0; i<pick.length; i++)
			pick[i] = random().nextDouble() < 0.5;

		return disconnect(X,Y,Cx,Cy,C,pick);
	}

	private Separator<V> disconnect(Set<V> X, Set<V> Y, Clique<V> Cx, Clique<V> Cy, Clique<V> C, boolean[] pick)
	{
		Separator<V> S = null;

		if (Cx == null)
		{
			if (Cy == null)
			{
				Cx = new Clique<V>(C,random());
				Cx.removeAll(Y);
				Cy = new Clique<V>(C,random());
				Cy.removeAll(X);

				S = new Separator<V>(Cx,Cy,random());
				jt.connect(Cx,Cy,S);

				Set<Clique<V>> neighbs = new LinkedHashSet<Clique<V>>(jt.getNeighbours(C));
				int i = 0;
				for (Clique<V> P : neighbs)
				{
					if (!disjoint(P,X))
					{
						Separator<V> Q = jt.connection(P,C);
						jt.disconnect(P,C);
						Q.setX(P);
						Q.setY(Cx);
						jt.connect(P,Cx,Q);
					}
					else if (!disjoint(P,Y))
					{
						Separator<V> Q = jt.connection(P,C);
						jt.disconnect(P,C);
						Q.setX(P);
						Q.setY(Cy);
						jt.connect(P,Cy,Q);
					}
					else
					{
						Separator<V> Q = jt.connection(P,C);
						jt.disconnect(P,C);
						Clique<V> R = ( pick[i++] ? Cx : Cy );
						Q.setX(P);
						Q.setY(R);
						jt.connect(P,R,Q);
					}
				}
				jt.remove(C);
			}
			else
			{
				S = jt.connection(Cy,C);
				S.removeAll(Y);
				C.removeAll(Y);
			}
		}
		else
		{
			if (Cy == null)
			{
				S = jt.connection(Cx,C);
				S.removeAll(X);
				C.removeAll(X);
			}
			else
			{
				jt.disconnect(Cx,C);
				jt.disconnect(Cy,C);
				jt.remove(C);
				S = new Separator<V>(Cx,Cy,random());
				jt.connect(Cx,Cy,S);
			}
		}

		for (V x : X)
			for (V y: Y)
				jt.graph().disconnect(x,y);
		
		return S;
	}

	private Clique<V> connect(Set<V> X, Set<V> Y, Clique<V> Cx, Clique<V> Cy, Separator<V> S)
	{
		Clique<V> C = null;

		if (Cx.size() == S.size() + X.size())
		{
			if (Cy.size() == S.size() + Y.size())
			{
				C = new Clique<V>(S,random());
				C.addAll(X);
				C.addAll(Y);
				jt.add(C);
				jt.disconnect(Cx,Cy);

				Set<Clique<V>> neighbs = new LinkedHashSet<Clique<V>>(jt.getNeighbours(Cx));
				for (Clique<V> N : neighbs)
				{
					Separator<V> Sn = jt.connection(Cx,N);
					jt.disconnect(Cx,N);
					Sn.setX(C);
					Sn.setY(N);
					jt.connect(C,N,Sn);
				}
				jt.remove(Cx);

				neighbs = new LinkedHashSet<Clique<V>>(jt.getNeighbours(Cy));
				for (Clique<V> N : neighbs)
				{
					Separator<V> Sn = jt.connection(Cy,N);
					jt.disconnect(Cy,N);
					Sn.setX(C);
					Sn.setY(N);
					jt.connect(C,N,Sn);
				}
				jt.remove(Cy);
			}
			else
			{
				C = Cx;
				C.addAll(Y);
				S.addAll(Y);
			}
		}
		else
		{
			if (Cy.size() == S.size() + Y.size())
			{
				C = Cy;
				C.addAll(X);
				S.addAll(X);
			}
			else
			{
				C = new Clique<V>(S,random());
				C.addAll(X);
				C.addAll(Y);
				jt.disconnect(Cx,Cy);
				jt.connect(Cx,C,new Separator<V>(Cx,C,random()));
				jt.connect(Cy,C,new Separator<V>(Cy,C,random()));
			}
		}

		for (V x : X)
			for (V y : Y)
				jt.graph().connect(x,y);

		return C;
	}
}
