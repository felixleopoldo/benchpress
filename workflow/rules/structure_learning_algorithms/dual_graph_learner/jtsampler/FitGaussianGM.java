import jpsgcs.alun.jtree.ContinuousDataMatrix;
import jpsgcs.alun.jtree.GaussianMarginalLikelihood;
import jpsgcs.alun.jtree.EdgePenaltyPrior;
import jpsgcs.alun.jtree.ProductGraphLaw;
import jpsgcs.alun.jtree.WSMGraphLaw;
import jpsgcs.alun.jtree.SMGraphLaw;
import jpsgcs.alun.jtree.ThreeCliquePrior;
import jpsgcs.alun.jtree.SuperGraphPrior;
import jpsgcs.alun.jtree.BornnCaronPrior;
import jpsgcs.alun.jtree.ForestPrior;
import java.util.ConcurrentModificationException;
import jpsgcs.alun.util.Main;
import jpsgcs.alun.util.Monitor;
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

import java.util.Set;
import java.util.LinkedHashSet;
import java.util.Random;

public class FitGaussianGM
{
	public static void main(String[] args)
	{
		try
		{
			Random rand = new Random();

			boolean showgraph = true;

			int n_samples = 100000000;
			int randomits = 1000;
			int sampler = 0;

			String[] bargs = Main.strip(args,"-v");
			if (bargs != args)
			{
				showgraph = false;
				args = bargs;
			}

			switch (args.length)
			{
			case 2: sampler = new Integer(args[1]).intValue();

			case 1: n_samples = new Integer(args[0]).intValue();

			case 0: break;

			default:
				System.err.println("Usage: java FitGaussianGM [s] [-v]");
				System.exit(1);
			}

			ContinuousDataMatrix data = new ContinuousDataMatrix();

			Integer[] x = new Integer[data.nColumns()];
			for (int i=0; i<x.length; i++)
				x[i] = new Integer(i);

			Monitor.restart();
			Monitor.show("Start");
			System.err.println("Sampler = "+sampler);

			//WSMGraphLaw<Variable> prior = new SuperGraphPrior<Variable>(supergraph);
			//WSMGraphLaw<Variable> prior = new BornnCaronPrior<Variable>(5,3);
			//WSMGraphLaw<Variable> prior = new ThreeCliquePrior<Variable>();
			//WSMGraphLaw<Variable> prior = new ForestPrior<Variable>();
			WSMGraphLaw<Integer> prior = new EdgePenaltyPrior<Integer>(1);

			SMGraphLaw<Integer> like = new GaussianMarginalLikelihood(data,1,1);
			WSMGraphLaw<Integer> posterior = new ProductGraphLaw<Integer>(like,prior);

			

			Network<Integer,Object> g = new Network<Integer,Object>();
			for (int i=0; i<data.nColumns(); i++)
				g.add(new Integer(i));

			Parameter temp = new Parameter("Temperature",0,1000,100);

			GraphFrame frame = null;
			if (showgraph)
			{
				frame = new GraphFrame<Integer,Object>(g,temp);
			}

			JTree<Integer> jt = new JTree<Integer>(g,rand);

		 	JTreeSampler<Integer> jts = null;

			switch(sampler)
			{
			case 4: jts = new MultiPairJTree2<Integer>(jt,posterior,true);
				break;
			
			case 3: jts = new MultiPairJTree<Integer>(jt,posterior,false);
				break;
			
			case 2: jts = new GiudiciGreen<Integer>(jt,posterior);
				break;

			case 1: jts = new UniformDecomposable<Integer>(jt,posterior);
				break;
			
			case 0:
			default:
				jts = new UniformJTree<Integer>(jt,posterior);
			}

			jts.randomize();

			double anneal  = 1.0;
			double cool = 0.999999;
			double best = -10000000000.0;

			for (int i=0; i<n_samples; i++)
			{
				//jts.setTemperature(temp.getValue()/100.0);
				anneal *= cool;
				jts.setTemperature(anneal);

				if (i % randomits == 0)
					jts.randomize();

				int up = 0;

				jts.randomUpdate();

			//	if (i % randomits == 0)
			//		System.out.println(posterior.logProbability(jt)+"\t"+anneal+"\t"+i);
			//		System.out.println(posterior.logProbability(jt));

				if (up == 0)
				{
					double thisone = posterior.logProbability(jt);
					if (best < thisone)
						best = thisone;
				}
			}

			Monitor.show("Done");
			System.out.println(posterior.logProbability(jt)+"\t"+best);
		}
		catch (ConcurrentModificationException cme)
		{
		}
		catch (Exception e)
		{
			System.err.println("Caught in FitGaussianGM.main()");
			e.printStackTrace();
		}
	}
}
