package jpsgcs.alun.viewgraph;

import jpsgcs.alun.graph.Graph;
import jpsgcs.alun.graph.GraphLocator;
import jpsgcs.alun.graph.RootedLocalLocator;
import jpsgcs.alun.graph.LocalLocator;
import jpsgcs.alun.animate.FrameQuitter;
import jpsgcs.alun.markov.Parameter;
import jpsgcs.alun.animate.Loop;
import jpsgcs.alun.animate.PlotMenu;
import jpsgcs.alun.animate.ActiveCanvas;
import jpsgcs.alun.animate.ParameterScrollWidget;

import java.util.Map;
import java.awt.Frame;
import java.awt.MenuItem;
import java.awt.Menu;
import java.awt.MenuBar;
import java.awt.Panel;
import java.awt.Component;
import java.awt.Dimension;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class GraphFrame<V,E> extends Frame
{
	public GraphFrame(Graph<V,E> g)
	{
		this(g,(Parameter[])null);
	}

	public GraphFrame(Graph<V,E> g, Parameter p)
	{
		this(g,asArray(p));
	}

	public GraphFrame(Graph<V,E> g, Parameter[] extras)
	{
		this(new PaintableGraph<V,E>(g),extras);
	}

	public GraphFrame(PaintableGraph<V,E> p)
	{
		this(p, (Parameter[]) null);
	}

	public GraphFrame(PaintableGraph<V,E> p, Parameter[] extras)
	{
		this(p,new RootedLocalLocator<V,E>(),extras);
	}

	public GraphFrame(Graph<V,E> g, GraphLocator<V,E> l)
	{
		this(new PaintableGraph<V,E>(g),l,(Parameter[])null);
	}

	public GraphFrame(PaintableGraph<V,E> p, GraphLocator<V,E> l)
	{
		this(p,l,(Parameter[])null);
	}

	public GraphFrame(Graph<V,E> p, GraphLocator<V,E> l, Parameter[] extras)
	{
		this(new PaintableGraph<V,E>(p),l,extras);
	}

	public GraphFrame(PaintableGraph<V,E> p, GraphLocator<V,E> l, Parameter[] extras)
	{
		this(p,l,extras,true);
	}

	public GraphFrame(PaintableGraph<V,E> p, GraphLocator<V,E> l, Parameter[] extras, boolean running)
	{
		loc = l;

		pan = new GraphPanel<V,E>(p,l,extras,running);
		add(pan);
		addWindowListener(new FrameQuitter());

		MenuBar bar = new MenuBar();
		setMenuBar(bar);

		bar.add(new RunMenu(pan.getLoop()));
		bar.add(new PlotMenu(this,pan.getCanvas()));

		pack();
		setVisible(true);
	}

	public ActiveCanvas getCanvas()
	{
		return pan.getCanvas();
	}

	public void flash()
	{
		pan.getCanvas().repaint();
	}

	public void fix()
	{
		pan.getLoop().stop();
	}

	public ParameterScrollWidget getParameterScrollbar(Parameter p)
	{
		for (ParameterScrollWidget w : pan.getParameterScrollWidgets())
			if (w.getParameter() == p)
				return w;
		return null;
	}

	public Thread getThread()
	{
		return pan.getLoop().getThread();
	}
	
	public PaintableGraph<V,E> getGraph()
	{
		return pan.getGraph();
	}

	public Map<V,VertexRepresentation> getMap()
	{
		return pan.getGraph().getMap();
	}

	public VertexRepresentation getRepresentation(V v)
	{
		return pan.getGraph().getRepresentation(v);
	}

	public void setRepresentation(V v, VertexRepresentation r)
	{
		pan.getGraph().setRepresentation(v,r);
	}

	public Parameter[] getLocatorParameters()
	{
		return loc.getParameters();
	}

// Private data and methods.

	private GraphPanel<V,E> pan = null;
	private GraphLocator<V,E> loc = null;

	static private Parameter[] asArray(Parameter p)
	{
		Parameter[] q = {p};
		return q;
	}
}
