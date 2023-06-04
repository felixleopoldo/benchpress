import jpsgcs.alun.util.*;
import jpsgcs.alun.markov.*;
import jpsgcs.alun.jtree.*;
import jpsgcs.alun.graph.*;
import jpsgcs.alun.viewgraph.*;
import java.util.*;
import java.awt.*;
import java.awt.event.*;

public class EstimateGM
{
	public static void main(String[] args)
	{
		try
		{
			// Handle command line options.
			ArgParser a = new ArgParser(args);

			boolean help = a.gotOpt("-h");
			boolean visual = a.gotOpt("-v");
			int totalits = a.intAfter("-n",1000000);
			int seed = a.intAfter("-r",0);
			int opt = a.intAfter("-s",0);
			double alpha = a.doubleAfter("-a",1.0);
			int maxclique = a.intAfter("-c",0);

			double lambda = a.doubleAfter("-pl",1);
			double phi = a.doubleAfter("-ph",1);
			double delta = a.doubleAfter("-pd",1);
			double gamma = a.doubleAfter("-pg",0);
			double kappa = a.doubleAfter("-pk",1);

			boolean nobenchout = a.gotOpt("-b");
			boolean graphout = a.gotOpt("-g");

			boolean header = true;
			boolean skipfirst = false;
			int randomits = 100;

			if (help)
			{
				System.err.println("Usage: java EstimateGM [options] < input.file > output.file");
				System.err.print("Options:\t");
				System.err.println("-h\t : Print this message.");
				System.err.println("\t\t-v\t : Show current state of graph in GUI. Default is not to.");
				System.err.println("\t\t-n n\t : Set the number of iterations to int n. Default is 1000000.");
				System.err.println("\t\t-r s\t : Set the random seed to int s. Default is pseudo random seed.");
				System.err.println("\t\t-a x\t : Set the edge penalty in the prior to double x. Default is 1.0.");
				System.err.println("\t\t-c k\t : Set the maximum clique size to int k. Default is no limit.");
				System.err.println("\t\t-s k\t : Set the sampler to the one indexed by int k.");
				System.err.println("\t\t\t\t 0 = Giudicci & Green (1999) sampler. This is the default.");
				System.err.println("\t\t\t\t 1 = Green & Thomas (2013) single edge junction tree sampler.");
				System.err.println("\t\t\t\t 2 = Green & Thomas (2013) multiple edge junction tree sampler.");
				System.err.println("\t\t-b\t : Turns off Benchpress style output. Default is on.");
				System.err.println("\t\t-g\t : Turns on printing of final graph as adjacencies. Default is off.");

				System.err.println("\t\t-pl x\t : Set the Dirichlet prior lambda hyper parameter to x. Default is 1.");
				System.err.println("\t\t-ph x\t : Set the Inverse-Wishart prior phi (n observations) hyper parameter to x. Default is 1.");
				System.err.println("\t\t-pd x\t : Set the Inverse-Wishart prior delta hyper parameter to x. Default is 1.");
				System.err.println("\t\t-pg x\t : Set the Normal prior gamma (mean) hyper parameter to x. Default is 0.");
				System.err.println("\t\t-pk x\t : Set the Normal prior kappa (n observations) hyper parameter to x. Default is 1.");

				System.exit(0);
			}

			// Set the random seed.

			Random rand = (seed > 0 ? new Random(seed) : new Random());

			// Read in the data.

			MixedDataMatrix data = new MixedDataMatrix(new InputFormatter(System.in,", \t\n\r\f"),header,skipfirst);
			//MixedMarginalLikelihood like = new MixedMarginalLikelihood(data,1,1,1,0,1);
			MixedMarginalLikelihood like = new MixedMarginalLikelihood(data,lambda,phi,delta,gamma,kappa);

			// Set up the intial state of the graph.

			Network<Variable,Object> g = new Network<Variable,Object>();

			Variable sink = new Variable();
			sink.setName("Sink");

			boolean nogaussians = true;

			for (Variable v : like.getVars())
			{
				if (v.isDefined())
				{
					g.connect(sink,v);
				}
				else
				{
					g.add(v);
					nogaussians = false;
				}
			}

			if (nogaussians)
				g.remove(sink);

			// Set up the viewer if required.

			Parameter temp = null;

			if (visual)
			{
				temp = new Parameter("Temperature",0,100,1);
				GraphFrame<Variable,Object> frame = new GraphFrame<Variable,Object>(g,temp);
			//	for (WindowListener w : frame.getWindowListeners())
			//		frame.removeWindowListener(w);
			//	frame.addWindowListener(new WindowCloser(graphout ? g : null));

				frame.getGraph().hide(sink);
				if (frame.getRepresentation(sink) != null)
					frame.getRepresentation(sink).setColor(Color.green);
	
				for (Variable v : like.getVars())
				{
					if (v.isDefined())
						frame.getRepresentation(v).setColor(Color.yellow);
					else
						frame.getRepresentation(v).setColor(Color.cyan);
				}
			}

			// Set up the sampling distribution.

			WSMGraphLaw<Variable>[] parts = (WSMGraphLaw<Variable>[]) new WSMGraphLaw[10];
			parts[0] = like;
			parts[1] = new EdgePenaltyPrior<Variable>(alpha);
			if (maxclique > 0)
				parts[2] = new MaxCliquePrior<Variable>(maxclique);
			WSMGraphLaw<Variable> posterior = new ProductGraphLaw<Variable>(parts);

			// Set up the and initialize the MCMC sampler.

			JTree<Variable> jt = new JTree<Variable>(g,rand);
			JTreeSampler<Variable> jts = null;

			switch(opt)
			{
			case 1: jts = new OnePairSampler<Variable>(sink,jt,posterior,true);
				break;
			case 2: jts = new MultiPairJTree2<Variable>(sink,jt,posterior,true);
				break;
			case 0: 
			default:
				jts = new GiudiciGreen<Variable>(sink,jt,posterior);
				break;
			}

			jts.setTemperature(1);
			jts.randomize();

			// Run the sampler.

			if (!nobenchout)
			{
				if (data.nCols() < 2)
				{
					System.err.println("Data must have at least 2 columns.");
					System.err.println("Exiting.");
					System.exit(1);
				}

				System.out.println("index,score,added,removed,code,delta,m");

				System.out.print("-2,0.0,");
				System.out.print("[");
				System.out.print(data.getName(0)+"-"+data.getName(1));
				for (int i=2; i<data.nCols(); i++)
					System.out.print(";"+data.getName(0)+"-"+data.getName(i));
				System.out.print("],");
                switch(opt)
                    {
                        // print order [success-failed-disconnect-failed-connect]
                    case 1:
                        // single pair JT sampler
                        // code [0-9-5]
                        System.out.print("[],[0-9-5],,");
                        break;
                    case 2:
                        System.out.print("[],,,");
                        break;
                    case 0:
                    default:
                        // GG 0 success, 4 failed disconnect, 6 failed connect
                        // code [0-4-6]
                        System.out.print("[],[0-4-6],,");
                        break;
                    }
                
				System.out.println();

				System.out.print("-1,0.0,");
				System.out.print("[],");
				System.out.print("[");
				System.out.print(data.getName(0)+"-"+data.getName(1));
				for (int i=2; i<data.nCols(); i++)
					System.out.print(";"+data.getName(0)+"-"+data.getName(i));
				System.out.print("],,,");
				System.out.println();

				System.out.print("0,");
				System.out.print(posterior.logProbability(jt)+",");
				System.out.print("[],[],,,");
				System.out.println();
			}
		
			for (int i=1; i<=totalits; i++)
			{
				if (visual)
					jts.setTemperature(temp.getValue());

				if (i % randomits == 0)
					jts.randomize();

				UpdateResult res = jts.randomUpdate();

				if (!nobenchout)// && res.getCode() == 0)
				{
					System.out.print(i+",");
					System.out.print(posterior.logProbability(jt)+",");
					System.out.println(res);
				}
			}

			// Output the result if required.

			if (graphout)
				System.out.println(g);

		}
		catch (ConcurrentModificationException cme)
		{
		}
		catch (Exception e)
		{
			System.err.println("Caught in EstimateGM.main()");
			e.printStackTrace();
		}
	}
}

class WindowCloser implements WindowListener
{
	public Graph g = null;
	
	public WindowCloser(Graph graph)
	{
		g = graph;
	}

	public void windowClosing(WindowEvent e) 
	{ 
		if (g != null)
		{
			System.out.flush();
			System.out.println(g);
			System.out.flush();
		}
		System.exit(0);
	}

	public void windowActivated(WindowEvent e) { }
	public void windowClosed(WindowEvent e) { }
	public void windowDeactivated(WindowEvent e) { }
	public void windowDeiconified(WindowEvent e) { }
	public void windowIconified(WindowEvent e) { }
	public void windowOpened(WindowEvent e) { }
}
