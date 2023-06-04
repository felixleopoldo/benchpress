package jpsgcs.alun.markov;

import java.util.Set;

/**
 This is a class to store the information needed in moving from
 a MarkovRandomField representing a product of functions to a 
 GraphicalModel that allows operating on the variables in the product.
*/

public class ModelInfo
{
	public ModelInfo(Set<Variable> c, Set<Variable> n, Set<Function> f, Set<Function> e)
	{
		clique = c;
		next = n;
		func = f;
		evid = e;
	}

	Set<Variable> clique = null;
	Set<Variable> next = null;
	Set<Function> func = null;
	Set<Function> evid = null;

	public String toString()
	{
		return clique+""; //+"\t-->\t"+next;
	}
}
