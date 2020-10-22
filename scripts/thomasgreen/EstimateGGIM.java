
import jpsgcs.alun.jtree.ContinuousDataMatrix;
import jpsgcs.alun.jtree.WSMGraphLaw;
import jpsgcs.alun.jtree.GGIMLikelihood;
import jpsgcs.alun.jtree.EdgePenaltyPrior;
import jpsgcs.alun.jtree.ProductGraphLaw;
import jpsgcs.alun.jtree.JTree;
import jpsgcs.alun.jtree.JTreeSampler;
import jpsgcs.alun.jtree.GiudiciGreen;
import jpsgcs.alun.jtree.UniformDecomposable;
import jpsgcs.alun.jtree.MultiPairJTree2;
import jpsgcs.alun.graph.Network;
import jpsgcs.alun.viewgraph.GraphFrame;
import jpsgcs.alun.markov.Parameter;
import jpsgcs.alun.util.Monitor;
import jpsgcs.alun.util.ArgParser;

import java.util.ConcurrentModificationException;
import java.util.Random;

public class EstimateGGIM
{
	public static void main(String[] args)
	{
		try
		{
		// Create random number generator.

			Random rand = new Random();

		// Set the parameters.

			ArgParser ap = new ArgParser(args);

			boolean showgraph = !ap.gotOpt("-v");
			int n_samples = ap.intAfter("-n",10000000);
			int sampler = ap.intAfter("-s",0); 
			int randomits = ap.intAfter("-r",1000);
			double penalty = ap.doubleAfter("-p",0);

		// Read the data.

			ContinuousDataMatrix data = new ContinuousDataMatrix();

		// Create a graph of Integers for the conditional independence graph
		// and find a junction tree of the graph.

			Network<Integer,Object> g = new Network<Integer,Object>();
			for (int i=0; i<data.nColumns(); i++)
				g.add(new Integer(i));

			JTree<Integer> jt = new JTree<Integer>(g,rand);

		// Make a prior that penalizes the number of edges in the graph.
		// Default is to have no penalty.

			WSMGraphLaw<Integer> prior = new EdgePenaltyPrior<Integer>(penalty);

		// Make a GGIM likelihood from the data.  This allows the GGIM sigma and rho parameters to be updated.
		// Initialize the parameters given the current junction tree.

			GGIMLikelihood likelihood = new GGIMLikelihood(data,1.0,0.5,rand);
			likelihood.updateSigma(jt);
			likelihood.updateRho(jt);

		// Make a posterior by combining the prior and likelihood.

			WSMGraphLaw<Integer> posterior = new ProductGraphLaw<Integer>(prior,likelihood);
			
		// Create a junction tree sampler to sample from the poserior.

		 	JTreeSampler<Integer> jts = null;

			switch(sampler)
			{
			// Samples uniformly on decomposable graphs.
			case 2: jts = new GiudiciGreen<Integer>(jt,posterior);
				break;

			// Samples uniformly on decomposable graphs.
			case 1: jts = new UniformDecomposable<Integer>(jt,posterior);
				break;
			
			// Samples uniformly on decomposable graphs.
			case 0:
			default:
				jts = new MultiPairJTree2<Integer>(jt,posterior,true);
			}

		// Randomize the initial junction tree.

			jts.randomize();

		// Create a slider bar to control annealing temperature. Scale is %.
		// That is parameter value of 100 will set temperature to 1.

			Parameter temp = new Parameter("Temperature",0,1000,100);

		// Create the graphial interface elements.

			GraphFrame frame = null;
			if (showgraph)
				frame = new GraphFrame<Integer,Object>(g,temp);

		// Run the sampler.

			Monitor.restart();
			Monitor.show("Start");
		
			for (int i=0; i<n_samples; i++)
			{
				jts.setTemperature(temp.getValue()/100.0);

				if (i % randomits == 0)
				{
					likelihood.updateRho(jt);
					likelihood.updateSigma(jt);
					jts.randomize();

					//System.out.println(likelihood.sigmasq()+"\t"+likelihood.rho());
					System.out.println(posterior.logProbability(jt));
				}
				//System.out.println(g);
				jts.randomUpdate();
			}

			System.out.println(g);

			Monitor.show("Done");
		}
		catch (ConcurrentModificationException cme)
		{
		}
		catch (Exception e)
		{
			System.err.println("Caught in EstimateGGIM.main()");
			e.printStackTrace();
		}
	}
}
