import jpsgcs.alun.util.Main;

import jpsgcs.alun.graph.Graphs;
import jpsgcs.alun.graph.Network;
import jpsgcs.alun.viewgraph.GraphFrame;

import java.util.Random;


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

public class RandomGraph
{
	public static void main(String[] args)
	{
		try
		{
			Random rand = new Random();

			int n = 100;
			double p = 0.01;
			boolean visual = true;
	
			switch(args.length)
			{
			case 3: visual = args[2].equals("+v");
			case 2: p = new Double(args[1]).doubleValue();
			case 1: n = new Integer(args[0]).intValue();
			}

			System.err.println("Expected number of edges in limiting distribution = " + (n*(n-1)/2.0*p));

			Network<String,Object> g = new Network<String,Object>();
			String[] v = new String[n];
			for (int i=0; i<n; i++)
			{
				v[i] = new String(i+"");
				g.add(v[i]);
			}
					
			GraphFrame f = null;
			if (visual)
				f = new GraphFrame<String,Object>(g);

			int nedges = 0;
			int count = 0;
			double total = 0;

			while (true)
			{
				if (visual)
					Thread.sleep(1);

				int i = (int)(rand.nextDouble() * n);
				int j = (int)(rand.nextDouble() * n);
				while (j == i)
					j = (int)(rand.nextDouble() * n);

				if (g.connects(v[i],v[j]))
				{
					if (rand.nextDouble() < (1-p)/p)
					{
						g.disconnect(v[i],v[j]);
						nedges--;
					}
				}
				else
				{
					if (rand.nextDouble() < p/(1-p))
					{
						g.connect(v[i],v[j]);
						nedges++;
					}
				}

				count++;
				total += nedges;

				System.out.println(nedges+" "+total/count);
			}
		}
		catch (Exception e)
		{
			System.err.println("Caught in RandomGraph.main()");
			e.printStackTrace();
			System.exit(1);
		}
	}
}
