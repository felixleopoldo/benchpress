package jpsgcs.alun.jtree;

public class GraphNotDecomposableException extends RuntimeException
{
	public GraphNotDecomposableException()
	{
		super("Can not make junction tree for non decomposable graph.");
	}
}
