package jpsgcs.alun.markov;

public interface Iterable
{
	abstract public void init();
	abstract public boolean next();
	abstract public int getNStates();
}
