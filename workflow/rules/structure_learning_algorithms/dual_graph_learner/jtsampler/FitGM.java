import jpsgcs.alun.markov.Function;
import jpsgcs.alun.markov.Variable;
import jpsgcs.alun.jtree.MultinomialMarginalLikelihood;
import jpsgcs.alun.jtree.EdgePenaltyPrior;
import jpsgcs.alun.jtree.ProductGraphLaw;
import jpsgcs.alun.jtree.SMGraphLaw;
import jpsgcs.alun.jtree.WSMGraphLaw;
import jpsgcs.alun.jtree.ThreeCliquePrior;
import jpsgcs.alun.jtree.SuperGraphPrior;
import jpsgcs.alun.jtree.BornnCaronPrior;
import jpsgcs.alun.jtree.ForestPrior;
import jpsgcs.alun.jtree.JTree;
import jpsgcs.alun.jtree.JTreeSampler;
import jpsgcs.alun.jtree.UniformDecomposable;
import jpsgcs.alun.jtree.MultiPairJTree2;
import jpsgcs.alun.jtree.GiudiciGreen;
import jpsgcs.alun.graph.Network;
import jpsgcs.alun.viewgraph.GraphFrame;
import jpsgcs.alun.util.Monitor;
import jpsgcs.alun.util.Main;
import jpsgcs.alun.jtree.DiscreteDataMatrix;
import jpsgcs.alun.markov.Parameter;
import java.util.ConcurrentModificationException;
import java.util.Random;

/**

	This program estimates a graphical model for discrete multivariate data.
<ul>
	Usage : <b> java FitGM < data [s] [-v] </b>
</ul>
	where
<ul>
	<li> <b> data </b> is the input data file. </li>
	<li> <b> s </b> is an optional parameter specifying the total number of iterations to be carried out.
	The default is 1000000. </li>
	<li> <b> -v </b> is a visualization option. If specified, a GUI showing the 
	conditional indpendence graph for the model is displayed. </li>
	
</ul>
<p>
	The input is assumed to have a line for each multivariate observation.
	Each line consists of a white space separated list of integer values.
	The multivariate observations are assumed to be independent and complete.

<p>
	The model is estimated by two rounds of Markov chain Monte Carlos searching.
	The first round of iterations is done with Metropolis sampling. The second
	is a random uphill search.
*/

public class FitGM
{
	public static void main(String[] args)
	{
		try
		{
			Random rand = new Random();

			Monitor.quiet(true);

			boolean visualize = false;
			double penalty = 1;

			int totalits = 10000000;
			int randomits = 1000;

			String[] bargs = Main.strip(args,"-v");
			if (bargs != args)
			{
				visualize = true;
				args = bargs;
			}
			
			switch (args.length)
			{
			case 1: totalits = new Integer(args[0]).intValue();

			case 0: break;

			default:
				System.err.println("Usage: java FitGMLD [s] [-v]");
				System.exit(1);
			}

			DiscreteDataMatrix data = new DiscreteDataMatrix();

			Variable[] vars = new Variable[data.nColumns()];
			for (int j=0; j<vars.length; j++)
				vars[j] = new Variable(data.statesOfColumn(j));

			//WSMGraphLaw<Variable> prior = new SuperGraphPrior<Variable>(supergraph);
			//WSMGraphLaw<Variable> prior = new BornnCaronPrior<Variable>(5,3);
			//WSMGraphLaw<Variable> prior = new ThreeCliquePrior<Variable>();
			//WSMGraphLaw<Variable> prior = new ForestPrior<Variable>();
			WSMGraphLaw<Variable> prior = new EdgePenaltyPrior<Variable>(penalty);

			SMGraphLaw<Variable> like = new MultinomialMarginalLikelihood(vars,data,1); 
			WSMGraphLaw<Variable> posterior = new ProductGraphLaw<Variable>(like,prior);

			Network<Variable,Object> g = new Network<Variable,Object>();
			for (Variable v : vars)
				g.add(v);

			Parameter temp = new Parameter("Temperature",0,1000,100);
			GraphFrame frame = ( visualize ? new GraphFrame<Variable,Object>(g,temp) : null );


			JTree<Variable> jt = new JTree<Variable>(g,rand);
			//JTreeSampler<Variable> jts = new UniformDecomposable<Variable>(jt,posterior);
			JTreeSampler<Variable> jts = new MultiPairJTree2<Variable>(jt,posterior,true);
			//JTreeSampler<Variable> jts = new GiudiciGreen<Variable>(jt,posterior);
			jts.randomize();

			// Go into the simulation loop.

			//boolean[] both = {true, false};
			boolean[] both = {true};
			
			for (boolean random : both)
			{
				System.err.println( random ? "Metropolis sampling" : "Uphill search");
				jts.setTemperature(random ? 1 : 0);

				for (int i=1; i<=totalits; i++)
				{
					if (i % 10000 == 0)
						System.err.print(".");
					if (i % 1000000 == 0)
						System.err.println();
			
					jts.setTemperature(temp.getValue()/100.0);
					if (i % randomits == 0)
					{
						jts.randomize();
					}
						
					jts.randomUpdate();
				 }

			//	Thread.sleep(1000);
				System.err.println();
//				System.err.println(posterior.accept + "\t" + posterior.tries + "\t" + posterior.accept/posterior.tries *100);
			}

			System.out.println(g);

		}
		catch (ConcurrentModificationException cme)
		{
		}
		catch (Exception e)
		{
			System.err.println("Caught in FitGMLD.main()");
			e.printStackTrace();
		}
	}
}
