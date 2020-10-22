package jpsgcs.alun.jtree;

import jpsgcs.alun.util.Pair;
import java.util.Collection;
import java.util.Set;
import java.util.LinkedHashSet;

public class OnePairSampler<V> extends AbstractJTreeSampler<V>
{
	private double storedEnum = 0;
	protected boolean uniformDecom = false;

	public OnePairSampler(V s, JTree<V> jt, WSMGraphLaw<V> cs, boolean u)
	{
		super(s,jt,cs);
		uniformDecom = u;
	
		if (uniformDecom)
			storedEnum = jt.logEnumerate();
	}

	public OnePairSampler(JTree<V> jt, WSMGraphLaw<V> cs, boolean u)
	{
		super(jt,cs);
		uniformDecom = u;
	
		if (uniformDecom)
			storedEnum = jt.logEnumerate();
	}

	public int randomConnection()
	{
		UpdateInfo<V> up = proposeConnection();

		if (up.errcode != 0)
			return up.errcode;

		double logprob = Math.log(up.Aij);
		logprob += deltaScore(up.S,up.x,up.y,up.type)/getTemperature();
		
		up.Cxy = connect(up.x,up.y,up.Cx,up.Cy,up.S);
		double newEnum = jt.logEnumerate();

		if (uniformDecom)
			logprob += storedEnum - newEnum;

		if (Math.log(random().nextDouble()) < logprob)
		{
			storedEnum = newEnum;
			return 0;
		}

		
		Pair<Clique<V>,Clique<V>> p = jt.cliquePair(up.x,up.y,up.Cxy);
		disconnect(up.x,up.y,p.x,p.y,up.Cxy);
		return 5;
	}

	public int randomConDis()
	{
		UpdateInfo<V> con = proposeConnection();
		if (con.errcode != 0)
			return con.errcode;

		double logprob = Math.log(con.Aij);
		logprob += deltaScore(con.S,con.x,con.y,con.type)/getTemperature();
		
		con.Cxy = connect(con.x,con.y,con.Cx,con.Cy,con.S);
		double newEnum = jt.logEnumerate();
		if (uniformDecom)
			logprob += storedEnum - newEnum;

		UpdateInfo<V> dis = proposeDisconnection();
		if (dis.errcode != 0)
		{
			Pair<Clique<V>,Clique<V>> p = jt.cliquePair(con.x,con.y,con.Cxy);
			disconnect(con.x,con.y,p.x,p.y,con.Cxy);
			return 1001;
		}

		logprob += Math.log(dis.Aij);
		logprob += deltaScore(dis.Cxy,dis.x,dis.y,dis.type)/getTemperature();
		
		dis.S = disconnect(dis.x,dis.y,dis.Cx,dis.Cy,dis.Cxy);
		double midEnum = newEnum;
		newEnum = jt.logEnumerate();
		if (uniformDecom)
			logprob += midEnum - newEnum;

		if (Math.log(random().nextDouble()) < logprob)
		{
			storedEnum = newEnum;
			return 0;
		}
			
		Pair<Clique<V>,Clique<V>> p = jt.cliquePair(dis.x,dis.y,dis.S);
		connect(dis.x,dis.y,p.x,p.y,dis.S);

		for (Clique<V> c : jt.getCliques())
		{
			if (c.contains(con.x) && c.contains(con.y))
			{
				con.Cxy = c;
				break;
			}
		}

		p = jt.cliquePair(con.x,con.y,con.Cxy);
		disconnect(con.x,con.y,p.x,p.y,con.Cxy);
		return 999;
	}

	public int randomDisconnection()
	{
		UpdateInfo<V> up = proposeDisconnection();

		if (up.errcode != 0)
			return up.errcode;

		double logprob = Math.log(up.Aij);
		logprob += deltaScore(up.Cxy,up.x,up.y,up.type)/getTemperature();
		
		up.S = disconnect(up.x,up.y,up.Cx,up.Cy,up.Cxy);
		double newEnum = jt.logEnumerate();

		if (uniformDecom)
			logprob += storedEnum - newEnum;

		if (Math.log(random().nextDouble()) < logprob)
		{
			storedEnum = newEnum;
			return 0;
		}

		Pair<Clique<V>,Clique<V>> p = jt.cliquePair(up.x,up.y,up.S);
		connect(up.x,up.y,p.x,p.y,up.S);
		return 9;
	}

	public UpdateInfo<V> proposeConnection()
	{
		UpdateInfo<V> up = new UpdateInfo<V>();

		if (jt.separators.isEmpty())
		{
			up.errcode = 1;
			return up;
		}

		up.S = jt.separators.next();

		up.Cx = up.S.getX();
		up.x = up.Cx.next();
		while (up.S.contains(up.x)) 
			up.x = up.Cx.next();

		up.Cy = up.S.getY();
		up.y = up.Cy.next();
		while (up.S.contains(up.y)) 
			up.y = up.Cy.next();

		if (sink != null && (up.x == sink || up.y == sink))
		{
			up.errcode = 3;
			return up;
		}

		up.Aij = jt.separators.size() * (up.Cx.size()-up.S.size()) * (up.Cy.size()-up.S.size());
		up.type = -1;

		if (up.Cx.size() == up.S.size() + 1)
		{
			if (up.Cy.size() == up.S.size() + 1)
			{
				up.Aij /= (jt.cliques.size()-1) * (up.S.size()+2) * (up.S.size()+1) / 2.0;

				for (Clique<V> N : jt.getNeighbours(up.Cx))
					if (N != up.Cy && !N.contains(up.x))
						up.Aij /= 2;

				for (Clique<V> N : jt.getNeighbours(up.Cy))
					if (N != up.Cx && !N.contains(up.y))
						up.Aij /= 2;

				up.type = 0;
			}
			else
			{
				up.Aij /= jt.cliques.size() * (up.S.size()+2) * (up.S.size()+1) / 2.0;
				up.type = 2;
			}
		}
		else
		{
			if (up.Cy.size() == up.S.size() + 1)
			{
				up.Aij /= jt.cliques.size() * (up.S.size()+2) * (up.S.size()+1) / 2.0;
				up.type = 1;
			}
			else
			{
				up.Aij /= (jt.cliques.size()+1) * (up.S.size()+2) * (up.S.size()+1) / 2.0;
				up.type = 3;
			}
		}

		return up;
	}

	public UpdateInfo<V> proposeDisconnection()
	{
		UpdateInfo<V> up = new UpdateInfo<V>();

		if (jt.cliques.isEmpty())
		{
			up.errcode = 1;
			return up;
		}

		up.Cxy = jt.cliques.next();
		if (up.Cxy.size() < 2)
		{
			up.errcode = 2;
			return up;
		}

		up.x = up.Cxy.next();
		up.y = up.Cxy.next();
		while (up.y == up.x) 
			up.y = up.Cxy.next();

		if (sink != null && (up.x == sink || up.y == sink))
		{
			up.errcode = 3;
			return up;
		}

		int N = 0;
		int Nx = 0;
		int Ny = 0;
		up.Cx = null;
		up.Cy = null;

		up.Cxy.remove(up.x);
		up.Cxy.remove(up.y);

		for (Clique<V> P : jt.getNeighbours(up.Cxy))
		{
			if (P.contains(up.x))
			{
				if (P.contains(up.y))
				{
					up.Cxy.add(up.x);
					up.Cxy.add(up.y);
					up.errcode = 3;
					return up;
				}
				else
				{
					Nx++;
					if (jt.connection(P,up.Cxy).containsAll(up.Cxy))
						up.Cx = P;
				}
			}
			else
			{
				if (P.contains(up.y))
				{
					Ny++;
					if (jt.connection(P,up.Cxy).containsAll(up.Cxy))
						up.Cy = P;
				}
				else
				{
					N++;
				}
			}
		}

		up.Cxy.add(up.x);
		up.Cxy.add(up.y);

		up.type = -1;

		up.Aij = jt.cliques.size() * up.Cxy.size() * (up.Cxy.size() - 1) / 2.0;

		if (up.Cx == null)
		{
			if (up.Cy == null)
			{
				up.Aij /= jt.separators.size()+1;
				up.Aij /= Math.pow(0.5,N);
				up.type = 0;
			}
			else
			{
				if (Ny > 1)
				{
					up.errcode = 4;
					return up;
				}

				up.Aij /= jt.separators.size() * (up.Cy.size() - up.Cxy.size() + 2);
				up.type = 2;
			}
		}
		else
		{
			if (up.Cy == null)
			{
				if (Nx > 1)
				{
					up.errcode = 5;
					return up;
				}

				up.Aij /= jt.separators.size() * (up.Cx.size() - up.Cxy.size() + 2);
				up.type = 1;
			}
			else
			{
				if (Nx > 1 || Ny > 1 || N > 0)
				{
					up.errcode = 6;
					return up;
				}

				up.Aij /= (jt.separators.size()-1) * (up.Cx.size() - up.Cxy.size() + 2) * (up.Cy.size() - up.Cxy.size() + 2);
				up.type = 3;
			}
		}

		return up;
	}
}
