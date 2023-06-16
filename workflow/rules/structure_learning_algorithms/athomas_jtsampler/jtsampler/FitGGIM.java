import jpsgcs.alun.jtree.ContinuousDataMatrix;
import jpsgcs.alun.jtree.WSMGraphLaw;
import jpsgcs.alun.jtree.GGIMLikelihood;
import jpsgcs.alun.jtree.EdgePenaltyPrior;
import jpsgcs.alun.jtree.ProductGraphLaw;
import jpsgcs.alun.jtree.JTree;
import jpsgcs.alun.jtree.JTreeSampler;
import jpsgcs.alun.jtree.GiudiciGreen;
import jpsgcs.alun.jtree.UniformDecomposable;
import jpsgcs.alun.jtree.UniformJTree;
import jpsgcs.alun.jtree.MultiPairJTree;
import jpsgcs.alun.jtree.MultiPairJTree1;
import jpsgcs.alun.jtree.MultiPairJTree2;
import jpsgcs.alun.graph.Network;
import jpsgcs.alun.viewgraph.GraphFrame;
import jpsgcs.alun.markov.Parameter;
import jpsgcs.alun.util.Main;
import jpsgcs.alun.util.Monitor;

import java.util.Set;
import java.util.LinkedHashSet;
import java.util.ConcurrentModificationException;
import java.util.Random;

public class FitGGIM
{
	public static void main(String[] args)
	{
		try
		{
			Random rand = new Random();

		// Set the default parameters.

			boolean showgraph = true;
			int n_samples = 100000000;
			int randomits = 1000;
			int sampler = 0;
			double penalty = 1.5;

		// Read the command line arguments.

			String[] bargs = Main.strip(args,"-v");
			if (bargs != args)
			{
				showgraph = false;
				args = bargs;
			}

			switch (args.length)
			{
			case 3: penalty = new Double(args[2]).doubleValue();

			case 2: sampler = new Integer(args[1]).intValue();

			case 1: n_samples = new Integer(args[0]).intValue();

			case 0: break;

			default:
				System.err.println("Usage: java FitGGIM [n_samples] [sampler] [penalty] [-v]");
				System.exit(1);
			}

		// Read in the data from standard input.

			ContinuousDataMatrix data = new ContinuousDataMatrix();

		// Create a graph of Integers for the conditional independence graph.
		// And find a junction tree of the graph.

			Network<Integer,Object> g = new Network<Integer,Object>();
			for (int i=0; i<data.nColumns(); i++)
				g.add(new Integer(i));

			JTree<Integer> jt = new JTree<Integer>(g,rand);

		// Make a prior that penalizes the number of edges in the graph.

			WSMGraphLaw<Integer> prior = new EdgePenaltyPrior<Integer>(penalty);
		//	WSMGraphLaw<Integer> prior = new BornnCaronPrior<Integer>(0.1,0.001);
		//	WSMGraphLaw<Integer> prior = new ModifiedBCPrior<Integer>(2,4);
		//	WSMGraphLaw<Integer> prior = new NonBCPrior<Integer>(2);
		//	WSMGraphLaw<Integer> prior = new SymmetricalByrneDistribution<Integer>();
		//	WSMGraphLaw<Integer> prior = new ColouredByrneDistribution<Integer>();

		// Make a GGIM likelihood from the data.  This allows the GGIM sigma and rho parameters to be updated.
		// Initialize the parameters given the current junction tree.

			GGIMLikelihood likelihood = new GGIMLikelihood(data,1.0,0.5,rand);
			likelihood.updateSigma(jt);
			likelihood.updateRho(jt);

		// Make a posterior by combining the prior and likelihood.

			WSMGraphLaw<Integer> posterior = new ProductGraphLaw<Integer>(prior,likelihood);
			
		// Create a junction tree sampler to sample from the poserior.
		// Randomize the initial junction tree.

		 	JTreeSampler<Integer> jts = null;

			switch(sampler)
			{
			// Samples uniformly on jtrees.
			case 4: jts = new UniformJTree<Integer>(jt,posterior);
				break;
			
			// Samples uniformly on jtrees.
			case 3: jts = new MultiPairJTree<Integer>(jt,posterior,false);
				break;
			
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

			jts.randomize();

		// Create the graphial elements.

			Parameter temp = new Parameter("Temperature",0,1000,100);
			GraphFrame frame = null;
			if (showgraph)
				frame = new GraphFrame<Integer,Object>(g,temp);

		// Run the sampler.

			Monitor.restart();
			Monitor.show("Start");
			System.err.println("Sampler = "+sampler);
		
			for (int i=0; i<n_samples; i++)
			{
				jts.setTemperature(temp.getValue()/100.0);

				if (i % randomits == 0)
				{
					likelihood.updateRho(jt);
					likelihood.updateSigma(jt);
					jts.randomize();

					System.out.println(likelihood.sigmasq()+"\t"+likelihood.rho());
					//System.out.println(posterior.logProbability(jt));
					//System.err.print(".");
				}

				jts.randomUpdate();
			}

			Monitor.show("Done");
		}
		catch (ConcurrentModificationException cme)
		{
		}
		catch (Exception e)
		{
			System.err.println("Caught in FitGGIM.main()");
			e.printStackTrace();
		}
	}
}
