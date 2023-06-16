package jpsgcs.alun.markov;

abstract public class Table extends Function
{
	abstract public void setValue(double d);
	abstract public void increase(double d);

	abstract public double sum();
	abstract public void scale(double d);
	abstract public void increaseAll(double d);
	abstract public void invert();

	abstract public double max();
	abstract public double sumxlogx();

/*
	abstract public void log();
	abstract public void exp();
*/

	abstract public void clear();
	abstract public void allocate();
	abstract public void free();

//	abstract public double information();

//	abstract public double logLikelihood();
//	abstract public double degreesOfFreedom();
}
