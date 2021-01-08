package jpsgcs.alun.markov;

import jpsgcs.alun.graph.Network;
import java.util.Set;
import java.util.LinkedHashSet;
import java.util.Collection;
import java.util.ArrayList;

public class Functions
{
	static public Set<Variable> asSet(Variable[] v)
	{
		Set<Variable> s = new LinkedHashSet<Variable>();
		for (Variable u : v)
			s.add(u);
		return s;
	}
		
	static public Network<Variable,Object> markovGraph(Collection<Function> fs)
	{
		Network<Variable,Object> g = new Network<Variable,Object>();
		for (Function f : fs)
		{
			Variable[] var = f.getVariables();
			for (int i=0; i<var.length; i++)
			{
				g.add(var[i]);
				for (int j=i+1; j<var.length; j++)
					g.connect(var[i],var[j]);
			}
		}
		return g;
	}

	static public DenseTable margin(Function f, Set<Variable> s)
	{
		Set<Variable> v = new LinkedHashSet<Variable>();
		for (Variable x : f.getVariables())
			v.add(x);

		if (!v.containsAll(s))
			return null;

		MultiVariable m = new MultiVariable(v);
		DenseTable t = new DenseTable(s);
		t.allocate();

		for (m.init(); m.next(); )
			t.increase(f.getValue());

		return t;
	}

        static public void reduceStates(Function g)
        {
                Variable[] var = g.getVariables();

		Iterable it = g instanceof Iterable ? (Iterable) g : new MultiVariable(var);

                boolean[][] states = new boolean[var.length][];
                for (int i=0; i<states.length; i++)
                {
                        int max = 0;
                        for (var[i].init(); var[i].next(); )
                                if (max < var[i].getState())
                                        max = var[i].getState();
                        states[i] = new boolean[max+1];
                }

                for (it.init(); it.next(); )
                        if (g.getValue() > 0)
                                for (int i=0; i<states.length; i++)
                                        states[i][var[i].getState()] = true;

                for (int i=0; i<states.length; i++)
                        reduceStates(var[i],states[i]);
        }

        static private void reduceStates(Variable v, boolean[] states)
        {
                int c = 0;
                for (int j=0; j<states.length; j++)
                        if (states[j])
                                c++;

                int[] keep = new int[c];
                c = 0;
                for (int j=0; j<states.length; j++)
                        if (states[j])
                                keep[c++] = j;

                v.setStates(keep);
        }
}
