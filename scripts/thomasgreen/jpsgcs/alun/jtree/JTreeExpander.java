package jpsgcs.alun.jtree;

import jpsgcs.alun.util.RandomBag;
import jpsgcs.alun.hashing.RandomIdentitySet;

import java.util.Random;
import java.util.Set;
import java.util.HashSet;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Queue;

import jpsgcs.alun.util.Pair;
import jpsgcs.alun.hashing.LinkedIdentityHashMap;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;


import java.lang.Math;

public class JTreeExpander<V, E>
{
	protected Random rand = null;

	public JTreeExpander(Random r)
	{
		rand = r;
	}

	public void expand(JTree<Integer> tree, Integer new_node, double alpha, double beta)
	{
		JTree<Integer> subtree = randomSubtree(tree, alpha, beta);
		//JTree<Integer> newJTree = new JTree<>(tree);
		expandGivenSubtree(tree, subtree, new_node);
	}

    private Clique<Integer> randomSubset(Clique<Integer> clique)
    {
        Clique<Integer> retClique = new Clique<>(rand);
        for (Integer item : clique) {
            if (rand.nextBoolean()) {
                retClique.add(item);
            }
        }
        return retClique;
    }

    private Clique<Integer> randomNonemptySubset(Clique<Integer> clique)
    {
        Clique<Integer> retClique = new Clique<>(rand);
        Integer firstVertex = clique.next();
        retClique.add(firstVertex);
        if(clique.size() > 1) {     // if still not empty
            // draw random subset
            for (Integer item : clique) {
                if (rand.nextBoolean() && item != firstVertex) {
                    retClique.add(item);
                }
            }
        }
        return retClique;
    }


    public void expandGivenSubtree(JTree<Integer> tree, JTree<Integer> subtree, Integer new_vertex){
		
		Set<Separator<Integer>> new_separators = new HashSet<>();
		Set<Clique<Integer>> new_cliques = new HashSet<>();
		Set<Clique<Integer>> old_cliques = new HashSet<>();
		int subtree_order = subtree.getVertices().size();

		// System.out.println("subtree_order: " + subtree_order);
		if(subtree_order == 0)
		{
			Clique<Integer> new_node = new Clique<>(rand);
			new_node.add(new_vertex);
			Clique<Integer> arb_node = tree.getCliques().next();
            tree.add(new_node);
			Separator<Integer> new_sep = new Separator<>(new_node, arb_node, rand);
			tree.connect(new_node, arb_node, new_sep);
            double nEquivalentJTrees = tree.logEnumerate(new_sep);
			//JTreeSampler<Integer> jte = new JTreeSampler<Integer>();
			randomize(tree, new_sep);
		} else {
			// System.out.println("Non empty");
			// initialize S and M maps
            HashMap<Clique<Integer>, Boolean> sepConds = new HashMap<>();
            HashMap<Clique<Integer>, Clique<Integer>> S = new HashMap<>();
			HashMap<Clique<Integer>, Clique<Integer>> M = new HashMap<>();
			HashMap<Clique<Integer>, Clique<Integer>> RM = new HashMap<>();
			HashMap<Clique<Integer>, Clique<Integer>> C = new HashMap<>();
			HashMap<Clique<Integer>, HashSet<Clique<Integer>>> N_S = new HashMap<>();
			HashMap<Clique<Integer>, Double> P = new HashMap<>();
			for(Clique<Integer> c : subtree.getVertices()) {
				S.put(c, new Clique<>(rand));
				C.put(c, new Clique<>(rand));
				RM.put(c, new Clique<>(rand));
				N_S.put(c, new HashSet<>());
			}

			// Define separator sets
			for(Clique<Integer> c : subtree.getCliques()) {
				for(Clique<Integer> neig : subtree.getNeighbours(c)) {
					Separator<Integer> tmp_sep = new Separator<>(c, neig, rand);
					S.get(c).addAll(tmp_sep);
				}
			}
			// Define set RM[c] to draw vertices from
			for(Clique<Integer> c : subtree.getCliques()){
				RM.get(c).addAll(c);
				RM.get(c).removeAll(S.get(c));
			}

			// Draw random sets from RM
			for(Clique<Integer> c : subtree.getCliques()){
				// set separator condition

                sepConds.put(c, false);
				for(Clique<Integer> neig : subtree.getNeighbours(c)) {
					if (subtree_order == 1){
                        sepConds.put(c, true);
						break;
					}
					Separator<Integer> tmp_sep = new Separator<>(c, neig, rand);
					if(S.get(c).equals(tmp_sep)){
                        sepConds.put(c, true);
						break;
					}
				}

				if(sepConds.get(c)){
                    // draw vertices non-empty subset
                    M.put(c, randomNonemptySubset(RM.get(c)));
				}
				else {
                    // draw vertices arbitrarily
                    M.put(c, randomSubset(RM.get(c)));
                }
			}

			// Create the new cliques
			for(Clique<Integer> c : subtree.getCliques()){
				C.get(c).addAll(M.get(c));
				C.get(c).addAll(S.get(c));
				C.get(c).add(new_vertex);
				new_cliques.add(C.get(c));
			}

			// Get the neighbor set of each c which can be moved to C
			for(Clique<Integer> c : subtree.getCliques()){
				for(Clique<Integer> neig : tree.getNeighbours(c)){
					Separator<Integer> sep = new Separator<>(c, neig, rand);
					if(C.get(c).contains(sep) && !subtree.getCliques().contains(neig)){
						N_S.get(c).add(neig);
					}
				}
			}

			// Add the new cliques
			for(Clique<Integer> c : subtree.getCliques()){
				tree.add(C.get(c));
			}

			// Construct and add the new edges between the new cliques,
    		// replicating the subtree
    		for(Separator<Integer> sep : subtree.getAllSeparators()){
    			Separator<Integer> new_sep = new Separator<>(C.get(sep.getX()), C.get(sep.getY()), rand);
    			new_separators.add(new_sep);
    			tree.connect(new_sep.getX(), new_sep.getY(), new_sep);
    		}

    		// Move the neighbors of a swallowed node to the swallowing node
    		// Remove the swallowed node
    		for(Clique<Integer> c : subtree.getCliques()){
    			//if(C.get(c).containsAll(c)){ // c engulfed in C.get(c)
				if(C.get(c).size() == c.size()+1){ // c engulfed in C.get(c)
    				for(Clique<Integer> neig : tree.getNeighbours(c)){
    					if(!subtree.getCliques().contains(neig)){
    						Separator<Integer> sep = new Separator<>(C.get(c), neig, rand);
    						tree.connect(C.get(c), neig, sep);
    					}
    				}
    				// remove the old cliques and its incident edges
    				for(Clique<Integer> neigh : tree.getNeighbours(c)){
                        tree.disconnect(c, neigh);
                    }
    				tree.remove(c);
    				old_cliques.add(c);
    			} else { // c not engulfed in C.get(c)
					Separator<Integer> sep = new Separator<>(C.get(c), c, rand);
					//if(!new_separators.contains(sep)){
                    new_separators.add(sep);
					//} else{
                    //System.out.println("test");
                    //}
					tree.connect(C.get(c), c, sep);

					// Draw random subset of neighbors intersecting with subset of S U M
                    // Re-organise the neighbors
					for(Clique<Integer> neigh : N_S.get(c)) {
					    if(rand.nextBoolean()) {
                            Separator<Integer> neigh_sep = new Separator<>(C.get(c), neigh, rand);
                            tree.connect(C.get(c), neigh, neigh_sep);
                            tree.disconnect(c, neigh);
						}
					}
    			}
    		}

    		// Compute probabilities
            HashMap<Clique<Integer>, Double> N = new HashMap<>();
            for(Clique<Integer> c: subtree.getCliques()){
                if (!sepConds.get(c)){
                    P.put(c, Math.pow(2, -RM.get(c).size()));
                    if(c.size() + 1 == C.get(c).size()){
                        N.put(c, 1.0);
                    }else {
                        N.put(c, Math.pow(2, -N_S.get(c).size()));
                    }

                } else {
                    P.put(c, 1.0);
                    N.put(c, 1.0);
                    if(RM.get(c).size()>1) {
                        P.put(c, ((M.get(c).size() * Math.pow(2.0, (RM.get(c).size() - 1))) / RM.get(c).size()));
                        if((c.size() + 1) != C.get(c).size()){
                            N.put(c, Math.pow(2.0, -N_S.get(c).size()));
                        }
                    }
                }
            }

		}
	}

	public JTree<Integer> randomSubtree(JTree<Integer> tree, double alpha, double beta) 
	{
		Random rand = new Random();
		JTree<Integer> subtree = new JTree<>(rand);

		if (rand.nextDouble() > beta) {
			return subtree;
		}
		//GraphSkeleton<Clique<Integer>, Separator<Integer>> subtree = new JTree<Integer>(rand);
		RandomBag<Clique<Integer>> vertices = tree.getCliques();
     	Set<Clique<Integer>> visited = new HashSet<>();
     	Queue<Clique<Integer>> queue = new LinkedList<>();
     	// Get random start node
     	Clique<Integer> start_node = tree.getCliques().next();
     	//System.out.println("Start node: " + start_node);
     	queue.add(start_node);
     	double w = 0.0;    	
    	while(queue.size() > 0) {
    		Clique<Integer> node = queue.remove();
    		visited.add(node);
    		subtree.add(node);
    		for (Clique<Integer> neigh : tree.getNeighbours(node)) {
    			double b = rand.nextDouble();
    			if(!visited.contains(neigh)){
    				if(b < alpha) {
    					Separator<Integer> sep = new Separator<>(node, neigh, rand);
    					subtree.connect(node, neigh, sep);
    					queue.add(neigh);
    				} 
    				else {
	    				w += 1.0;
    				}
    			}

    		}
    	}
    	double v = subtree.getVertices().size();
    	int n = tree.getVertices().size();
    	double prob = (beta * v * Math.pow(alpha, v-1) / n) * Math.pow(1-alpha, w);
    	// System.out.println("prob: "+prob);
		return subtree;
	}

    public static <V> void randomize(JTree<V> jt, Separator<V> s)
    {
        // Find the sub tree of vertices containing s.
        // and the list of separators with intersection s

        RandomIdentitySet<Clique<V>> Ts = new RandomIdentitySet<Clique<V>>(jt.rand);
        List<Separator<V>> sep = new ArrayList<Separator<V>>();
        jt.collect(Ts,sep,s.getX(),s);

        if (Ts.size() == 2)
            return;

        // Disconnect the equivalent separators.

        for (Separator<V> ss : sep)
            jt.disconnect(ss.getX(),ss.getY());

        // Find the components of the subtree linked by s.

        List<RandomIdentitySet<Clique<V>>> Fs = new ArrayList<RandomIdentitySet<Clique<V>>>();
        Set<Clique<V>> Tscopy = new LinkedHashSet<Clique<V>>(Ts);

        while (!Tscopy.isEmpty())
        {
            RandomIdentitySet<Clique<V>> fsi = new RandomIdentitySet<Clique<V>>(jt.rand);
            jt.collect(fsi,Tscopy.iterator().next(),s);
            Tscopy.removeAll(fsi);
            Fs.add(fsi);
        }

        // Draw, with replacement, n-2 components of Ts with probability proportional to their size.

        Map<Clique<V>,RandomIdentitySet<Clique<V>>> h = new LinkedIdentityHashMap<Clique<V>,RandomIdentitySet<Clique<V>>>();
        for (RandomIdentitySet<Clique<V>> f : Fs)
            for (Clique<V> x : f)
                h.put(x,f);

        List<RandomIdentitySet<Clique<V>>> v = new ArrayList<RandomIdentitySet<Clique<V>>>();
        for (int i=0; i<Fs.size() - 2; i++)
            v.add(h.get(Ts.next()));

        // Put these random list and the set of compoenents into a sorter that will
        // deliver them in the appropriate order for the pruffer code.

        PruferSorter<RandomIdentitySet<Clique<V>>> ps = new PruferSorter<RandomIdentitySet<Clique<V>>>(v,Fs);

        while (ps.hasNext())
        {
            Pair<RandomIdentitySet<Clique<V>>,RandomIdentitySet<Clique<V>>> p = ps.next();
            Clique<V> x = p.getX().next();
            Clique<V> y = p.getY().next();

            Separator<V> ss = sep.remove(sep.size()-1);
            ss.setX(x);
            ss.setY(y);
            jt.connect(x,y,ss);
        }
    }

}
