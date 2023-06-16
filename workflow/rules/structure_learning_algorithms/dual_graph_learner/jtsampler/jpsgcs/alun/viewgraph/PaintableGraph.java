package jpsgcs.alun.viewgraph;

import jpsgcs.alun.graph.Graph;
import jpsgcs.alun.graph.LocatedMaskedGraph;
import jpsgcs.alun.animate.Paintable;
import jpsgcs.alun.graph.Coord;
import java.util.Map;
import java.util.LinkedHashMap;
import java.util.Collection;
import java.awt.Graphics;
import java.awt.Color;

public class PaintableGraph<V,E> extends LocatedMaskedGraph<V,E> implements Paintable, MakesRepresentation<V>
{
	public PaintableGraph(Graph<V,E> g, Map<V,VertexRepresentation> map, MakesRepresentation<V> rm)
	{
		super(g);
		repmaker = rm;
		node = map;
		//for (V v : g.getVertices())
		//	if (node.get(v) == null)
		//		node.put(v,repmaker.makeRepresentation(v));
	}

	public PaintableGraph(Graph<V,E> g, Map<V,VertexRepresentation> map)
	{
		super(g);
		repmaker = this;
		node = map;
		//for (V v : g.getVertices())
		//	if (node.get(v) == null)
		//		node.put(v,repmaker.makeRepresentation(v));
	}

	public PaintableGraph(Graph<V,E> g, MakesRepresentation<V> rm)
	{
		this(g,new LinkedHashMap<V,VertexRepresentation>(),rm);
	}

	public PaintableGraph(Graph<V,E> g)
	{
		this(g,new LinkedHashMap<V,VertexRepresentation>());
	}

	public VertexRepresentation makeRepresentation(V v)
	{
		return new StringNode(v.toString());
	}

	public void setArrows(boolean a)
	{
		arrows = a;
	}

	public void setArrowParameters(double baselength, double height, double position)
	{
		arrbs = baselength;
		arrht = height;
		ends = position;
	}

	public V find(double x, double y)
	{
		Collection<V> verts = getVertices();
		if (verts != null)
			for (V v: verts)
			{
				Coord pv = getCoord(v);
				if (getRepresentation(v).contains(pv.x - x, pv.y - y))
					return v;
			}
		return null;
	}

	public void paint(Graphics g)
	{
		Collection<V> verts = getVertices();

		if (verts == null)
			return;

		for (V v: verts)
		{
			Coord pv = getCoord(v);
			if (pv.v)
			{
				for (V u: outNeighbours(v))
				{
					Coord pu = getCoord(u);
					if (pu.v)
					{
						Color col = Color.black;
						E con = connection(v,u);
						if (con instanceof Color)
							col = (Color) con;
		
						if (arrows && isDirected())
							arrow(g,pv.x,pv.y,pu.x,pu.y,col);
						else
							line(g,pv.x,pv.y,pu.x,pu.y,col);
					}
				}
			}
		}

		for (V v: verts)
		{
			Coord pv = getCoord(v);
			if (pv.v)
			{
				VertexRepresentation nv = getRepresentation(v);
			//	nv.paint(g,pv.x,pv.y, getNeighbours(v).containsAll(completeGraph().getNeighbours(v)));
				Collection<? extends V> nall = completeGraph().getNeighbours(v);
				Collection<V> nshow = getNeighbours(v);
				boolean comp = true;
				if (nall != null && nshow != null)
					comp = nshow.containsAll(nall);
				nv.paint(g,pv.x,pv.y,comp);
			}
		}
	}

	public Map<V,VertexRepresentation> getMap()
	{
		return node;
	}

	public VertexRepresentation getRepresentation(V v)
	{
		VertexRepresentation r = node.get(v);
		if (r == null)
		{
			r = repmaker.makeRepresentation(v);
			node.put(v,r);
		}
		return r;
	}

	public void setRepresentation(V v, VertexRepresentation r)
	{
		node.put(v,r);
	}

// Private data

	private Map<V,VertexRepresentation> node = null;
	private MakesRepresentation repmaker = null;

	private boolean arrows = true;
	private double arrbs = 4.0;
	private double arrht = 2.0;
	private double ends = 0.5;

	private void line(Graphics g, double x1, double y1, double x2, double y2)
	{
		line(g,x1,y1,x2,y2,Color.black);
	}

	private void line(Graphics g, double x1, double y1, double x2, double y2, Color c)
	{
		g.setColor(c);
		g.drawLine((int)x1, (int)y1, (int)x2, (int)y2);
	}

	private void arrow(Graphics g, double x1, double y1, double x2, double y2)
	{
		arrow(g,x1,y1,x2,y2,Color.black);
	}

	private void arrow(Graphics g, double x1, double y1, double x2, double y2, Color c)
	{
		line(g,x1,y1,x2,y2,c);

		int sg = x1 < x2 ? 1 : -1;
		double th = Math.atan((y2-y1)/(x2-x1));
		double s = arrbs * Math.cos(th);
		double t = arrbs * Math.sin(th);
		double x = ends * x1 + (1-ends) * x2;
		double y = ends * y1 + (1-ends) * y2;
		int[] xx = {(int)(x-t), (int)(x+t), (int)(x + arrht*s*sg)};
		int[] yy = {(int)(y+s), (int)(y-s), (int)(y + arrht*t*sg)};

		g.setColor(Color.white);
		g.fillPolygon(xx,yy,3);
		g.setColor(Color.black);
		g.drawPolygon(xx,yy,3);
	}
}
