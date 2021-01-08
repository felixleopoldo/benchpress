package jpsgcs.alun.util;

/**
 This is supposed to be a safe subclass of Thread that 
 allows starting, stopping, suspending and resuming of a thread.
 It handles all these threading opperations but delegates the
 actual work to be done to a SafeRunnable object that implements
 an inner loop.
*/
public class SafeThread extends Thread
{
/**
 Creates a new safe Thread with the given delegate.
*/
	public SafeThread(SafeRunnable r)
	{
		runner = r;
	}

/**
 Suspends the thread.
*/
	public void safeSuspend()
	{
		running = false;
	}

/**
 Resumes the running of the thread.
*/
	synchronized public void safeResume()
	{
		running = true;
		notify();
	}

/**
 Flips between suspended and running states.
*/
	synchronized public void safeFlip()
	{
		if (running == true)
			safeSuspend();
		else
			safeResume();
	}

	synchronized public boolean isRunning()
	{
		return running;
	}

/**
 Stops the thread. It cannot then be resumed.
*/
	synchronized public void safeStop()
	{
		done = true;
		notify();
	}

/**
 Starts the thread.
*/
	public void safeStart()
	{
		start();
	}

/**
 Returns true only if the thread has been stopped.
*/
	public boolean isDone()
	{
		if (!done)
		{
			try
			{
				synchronized(this)
				{
					while (!running && !done)
						wait();
				}
			}
			catch (InterruptedException e)
			{
				System.err.println("Caught in SafeThread:isDOne() "+e);
				e.printStackTrace();
			}
		}

		return done;
	}

/**
 While the thread is not done, this method calls the loop() method
 in the delegate.
*/
	public void run()
	{
		while (!this.isDone())
			runner.loop();
	}

// Private data.
	
	private volatile boolean running = true;
	private volatile boolean done = false;
	private SafeRunnable runner = null;
}
