package jpsgcs.alun.util;

/**
 This is an interface for an object that will accept work
 from a SafeThread object.
*/
public interface SafeRunnable
{
/**
 While the SafeThread that uses this object as a delegate is
 running it will repeatedly call this method.
*/
	public void loop();
}
