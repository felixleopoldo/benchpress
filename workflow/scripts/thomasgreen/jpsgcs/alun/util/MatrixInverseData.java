package jpsgcs.alun.util;

public class MatrixInverseData
{
	public double det()
	{
		return determinant;
	}

	public double[][] inv()
	{
		return inverse;
	}
	
	protected double determinant = 0;
	protected double logdeterminant = 0;
	protected double[][] inverse = null;
}
