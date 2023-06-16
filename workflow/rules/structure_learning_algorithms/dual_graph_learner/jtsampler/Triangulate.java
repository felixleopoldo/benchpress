import jpsgcs.alun.graph.Graph;
import jpsgcs.alun.graph.Network;
import jpsgcs.alun.graph.Graphs;

/**
	This program uses a greedy algorithm to find a triangulation 
	of the input graph.
<ul>
	Usage : <b> Triangulate < input.graph > output.graph </b>
</ul>
where
<ul>
<li> <b> input.graph </b> is a file containing a graph specified as an adjacency list.
More specifically, each vertex is represented by a unique string. For each line of
input the vertex represented by the first string on the line is connected to the
vertices represented by any following strings. </li>
<li> <b> output.graph </b> is a file containing the output graph in the same format 
as the input graph. The output graph will contain all the vertices and edges of the
input graph plus an additional set of edges that ensure the output graph has no
unchorded 4-cycles.</li>
</ul>
<p>

	The greedy algorithm seeks to minimize the size of the largest
	clique in the output graph.

*/

public class Triangulate
{
	public static void main(String[] args)
	{
		try
		{
			Network<String,Object> g = Graphs.read();
			Graphs.triangulate(g);
			System.out.println(g);
		}
		catch (Exception e)
		{
			System.err.println("Caught in Triangulate:main()");
			e.printStackTrace();
		}
	}
}
