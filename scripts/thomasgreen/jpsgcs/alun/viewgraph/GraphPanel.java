package jpsgcs.alun.viewgraph;

import jpsgcs.alun.graph.GraphLocator;
import jpsgcs.alun.markov.Parameter;
import jpsgcs.alun.animate.Loop;
import jpsgcs.alun.animate.ParameterScrollWidget;
import jpsgcs.alun.animate.ActiveCanvas;
import java.awt.Panel;
import java.awt.BorderLayout;
import java.awt.GridLayout;
import java.awt.event.AdjustmentEvent;
import java.awt.event.AdjustmentListener;

public class GraphPanel<V,E> extends Panel
{
	public GraphPanel(PaintableGraph<V,E> g, GraphLocator<V,E> loc)
	{
		this(g,loc,null);
	}

	public GraphPanel(PaintableGraph<V,E> g, GraphLocator<V,E> loc, Parameter[] extras)
	{
		this(g,loc,extras,true);
	}


	public GraphPanel(PaintableGraph<V,E> g, GraphLocator<V,E> loc, Parameter[] extras, boolean running)
	{
		graph = g;

		loc.set(g);

		ann = new GraphAnimator<V,E>(g,loc);
		setLayout(new BorderLayout());
		add(ann.getCanvas(),BorderLayout.CENTER);

		if (running)
			ann.getLoop().start();

		makeScrollPanel(loc.getParameters(),extras);
	}

	public void makeScrollPanel(Parameter[] par,Parameter[] extras)
	{
		Panel p = new Panel();

		int len = par.length;
		if (extras != null)
			len += extras.length;

		w = new ParameterScrollWidget[len];
		int j = 0;

		p.setLayout(new GridLayout(len,1));
		
		for (int i=0; i<par.length; i++)
		{
			w[j] = new ParameterScrollWidget(par[i]);
			p.add(w[j].getPanel());
			j++;
		}

		if (extras != null)
			for (int i=0; i<extras.length; i++)
			{
				w[j] = new ParameterScrollWidget(extras[i]);
				p.add(w[j].getPanel());
				j++;
			}
	
		add(p,BorderLayout.SOUTH);
	}

	public Loop getLoop()
	{
		return ann.getLoop();
	}

	public ActiveCanvas getCanvas()
	{
		return ann.getCanvas();
	}

	public ParameterScrollWidget[] getParameterScrollWidgets()
	{
		return w;
	}

	public PaintableGraph<V,E> getGraph()
	{
		return graph;
	}

	private PaintableGraph<V,E> graph = null;
	private ParameterScrollWidget[] w = null;
	private GraphAnimator<V,E> ann = null;
}
