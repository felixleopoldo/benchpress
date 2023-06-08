import jpsgcs.alun.util.Main;

import jpsgcs.alun.graph.Graphs;
import jpsgcs.alun.graph.Network;
import jpsgcs.alun.graph.GraphLocator;

import jpsgcs.alun.viewgraph.PaintableGraph;
import jpsgcs.alun.viewgraph.Blob;
import jpsgcs.alun.viewgraph.VertexRepresentation;
import jpsgcs.alun.viewgraph.GraphFrame;

import java.util.Map;
import java.util.LinkedHashMap;
import java.awt.Panel;
import java.awt.Frame;


/**
 	This is and interactive graphical program for viewing and editing a graph.

<ul>
	<li>Usage: <b> java ViewGraph < input.graph </b>
	</li>
</ul>
        where
<ul>
<li> <b> input.graph </b> is a file containing a graph specified as an adjacency list.
More specifically, each vertex is represented by a unique string. For each line of 
input the vertex represented by the first string on the line is connected to the
vertices represented by any following strings. </li>
</ul>

<p>
	As an example, the following two listings specifiy the graph shown in the
	picture below.
<br><hr>
A B <br>
C D <br>
C E <br>
B E <br>
D F <br>
F G <br>
A G <br>
G H <br>
G C <br>
B C <br>
I <br>
<br><hr>
C B D E <br>
B A E <br>
F D G <br>
G A H C <br>
I <br>
<br><hr>
<img src="graph.jpg" align=center border=0>
<br><hr>

<p>
<b> Mouse, button and key instructions </b>
<p>

The program is controled by a slide bar, some buttons, the arrow, home and shift keys,
but mostly by mouse operations. 
All three mouse buttons are used. 
<br>

<ul>
<li> 
The <b>slide bar</b> at the bottom controls the repulsive force in
the energy equation used to set the coordinates.
</li>
<br> <br>

<li>
Mouse operations <b> without shift key </b> and <b> without control key </b> pressed.
	<ul>
	<li> Left mouse.
	Drags a vertex. Vertex is free on release.
	</li>
	<li> Middle mouse.
	Drags a vertex. Vertex is fixed at release position.
	</li>
	<li> Right mouse.
	Translates the view by the amount dragged.
	A bit like putting your finger on a piece of paper and moving it.
	</li>
	<li> Double click with any mouse button in the background resets the
	vertices to new random positions.
	</li>
	</ul>
</li>
<br>

<li>
Mouse operations in <b> with shift key </b> but <b> without control key </b> pressed.
	<ul>
	<li> Left mouse.
	Drags a vertex and the component it is in. Vertex and component free
	on release.
	</li>
	<li> Middle mouse.
	Drags a vertex and the component it is in. Vertex and component are 
	fixed at release positions.
	</li>
	<li> Right mouse.
	Translates the positions of the vertices relative to the position 
	of the paper by the amount dragged.
	This is useful to center the picture on the paper ready for outputing.
	</li>
	</ul>
</li>
<br>

<li>
Mouse operations <b> without shift key </b> but with <b> with control key </b> pressed.
	<ul>
	<li> Left mouse.
	Click on a vertex to add its neighbours to the graph.
	</li>
	<li> Middle mouse.
	Click on a vertex to delete it from the graph.
	</li>
	<li> Double click left mouse replaces all deleted
	vertices in the graph.
	</li>
	<li> Double click middle mouse deletes all vertices from the
	graph.
	</li>
	</ul>
</li>
<br>

<li>
Mouse operations <b> with shift key </b> and <b> with control key </b> pressed.
	<ul>
	<li> Left mouse.
	Click on a vertex to replace all vertices in the same component
	to the graph.
	</li>
	<li> Middle mouse.
	Click on a vertex to delete it and the component it is in from
	the graph.
	</li>
	</ul>
</li>
<br>

<li>
Arrow key functions with <b> without shift key pressed </b>.
Mouse has to be in the picture canvas.
	<ul>
	<li> Up arrow. Increases the scale of viewing by 10%.
	</li>
	<li> Down arrow. Decreased the scale of viewing by 10%.
	</li>
	<li> Left arrow. Rotates the view by 15 degrees clockwise.
	</li> 
	<li> Right arrow. Rotates the view by 15 degrees anticlockwise.
	</li>
	<li> Home key. Removes all scalings and rotations and places the origin at
		the center of the picture canvas.
	</li>
	</ul>
</li>
<br>

<li>
Arrow key functions <b> with shift key pressed </b>.
Mouse has to be in the picture canvas.
	<ul>
	<li> Up arrow. Increases the vertex positions by 10% relative to the 
	scale of the paper.
	</li>
	<li> Down arrow. Decreases the vertex positions by 10% relative to the
	scale of the paper.
	</li>
	<li> Left arrow. Rotates the vertex positions by 15 degrees clockwise relative
	to the paper orientation.
	</li> 
	<li> Right arrow. Rotates the vertex poritions by 15 degrees anticlockwise 
	relative to the paper orientation.
	</li>
	</ul>
</li>
<br>

*/

public class ViewGraph
{
	public static void main(String[] args)
	{
		try
		{
			boolean useblobs = false;
			boolean directed = false;

			String[] bargs = Main.strip(args,"-b");
			if (bargs != args)
			{
				useblobs = true;	
				args = bargs;
			}
		
			bargs = Main.strip(args,"-d");
			if (bargs != args)
			{
				directed = true;	
				args = bargs;
			}
		
			Network<String,Object> g = Graphs.read(directed);
					
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
			System.err.println("Caught in ViewGraph.main()");
			e.printStackTrace();
			System.exit(1);
		}
	}
}
