import jpsgcs.alun.graph.Network;
import jpsgcs.alun.graph.GraphLocator;
import jpsgcs.alun.graph.DAGLocator;
import jpsgcs.alun.viewgraph.Blob;
import jpsgcs.alun.viewgraph.GraphFrame;
import jpsgcs.alun.viewgraph.PaintableGraph;
import jpsgcs.alun.viewgraph.VertexRepresentation;
import jpsgcs.alun.util.Main;

import java.awt.Frame;
import java.util.Map;
import java.util.LinkedHashMap;
import java.util.StringTokenizer;
import java.io.BufferedReader;
import java.io.InputStreamReader;

/**
 	This is and interactive graphical program for viewing and editing a directed acyclic graph.

<ul>
	<li>Usage: <b> java ViewDAG < input.dag </b>
	</li>
</ul>
        where
<ul>
<li> <b> input.dag </b> is a file containing a graph specified as an adjacency list.
More specifically, each vertex is represented by a unique string. For each line of 
input the vertex represented by the first string on the line is connected upward 
to the
vertices represented by any following strings. That is, the first string is
the child vertex, the following ones are the parents.</li>
</ul>

<p>
	For information on the use of the mouse and keys to control the GUI
	see the page for ViewGraph.
<p>
	The positioning of vertices for this program uses three parameters.
<ul>
	<li> <b> X-repulsion </b> controls the general repulsion between vertices. </li>
	<li> <b> Y-repulsion </b> controls the prefered distance between a parent and child
	vertex in the vertical direction </li>
	<li> <b> Gravity </b> controls the relative weighting of the X and Y repulsion terms.
	When this paramter is zero the positioning methods is the same as for ViewGraph.
	</li>
</ul>
*/

public class ViewDAG
{
	public static void main(String[] args)
	{
		try
		{
			boolean useblobs = false;
			
			String[] bargs = Main.strip(args,"-b");
			if (bargs != args)
			{
				useblobs = true;
				args = bargs;
			}
		
			Network<String,Object> g = new Network<String,Object>(true);
			
			BufferedReader b = new BufferedReader(new InputStreamReader(System.in));
			for (String s = b.readLine(); s != null; s = b.readLine())
			{
				StringTokenizer t = new StringTokenizer(s);
				if (t.hasMoreTokens())
				{
					String v = t.nextToken();
					g.add(v);
					while(t.hasMoreTokens())
					{
						String parent = t.nextToken();
						if (!g.contains(parent))
							throw new RuntimeException("For a DAG the parent vertex ("+parent+") must appear above child vertex ("+v+") in the list.");
						else
							g.connect(parent,v);
					}
				}
			}
					
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

			GraphLocator<String,Object> loc = new DAGLocator<String,Object>();

			Frame f = new GraphFrame<String,Object>(pg,loc);
		}
		catch (Exception e)
		{
			System.err.println("Caught in ViewDAG.main()");
			e.printStackTrace();
			System.exit(1);
		}
	}
}
