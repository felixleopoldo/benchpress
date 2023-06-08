import jpsgcs.alun.util.Main;

import jpsgcs.alun.graph.Graphs;
import jpsgcs.alun.graph.Network;

import jpsgcs.alun.viewgraph.PaintableGraph;
import jpsgcs.alun.viewgraph.Blob;
import jpsgcs.alun.viewgraph.VertexRepresentation;
import jpsgcs.alun.viewgraph.GraphFrame;

import java.util.Map;
import java.util.LinkedHashMap;
import java.awt.Panel;
import java.awt.Frame;


public class ViewNeighbourhood
{
	public static void main(String[] args)
	{
		try
		{
			boolean useblobs = false;
			int deg = 1;
			String root = "";

			String[] bargs = Main.strip(args,"-b");
			if (bargs != args)
			{
				useblobs = true;	
				args = bargs;
			}

			switch(args.length)
			{
			case 2: root = args[0];
				deg = new Integer(args[1]).intValue();
				break;

			default: System.err.println("Usage: java ViewNeighbourhood root degree <graph");
				System.exit(1);
			}

			Network<String,Object> gg = Graphs.read();
			Network<String,Object> g = new Network<String,Object>();
			Graphs.inducedSubgraph(gg,Graphs.breadthFirstSearch(gg,root,deg),g);
					
			PaintableGraph<String,Object> pg = null;

			if (useblobs)
			{
				Map<String,VertexRepresentation> map = new LinkedHashMap<String,VertexRepresentation>();
				Blob blob = new Blob();
				for (String s : g.getVertices())
					map.put(s,blob);
				pg = new PaintableGraph<String,Object>(g,map);
			}
			else
			{
				pg = new PaintableGraph<String,Object>(g);
			}

			Frame f = new GraphFrame<String,Object>(pg);
		}
		catch (Exception e)
		{
			System.err.println("Caught in ViewNeighbourhood.main()");
			e.printStackTrace();
			System.exit(1);
		}
	}
}
