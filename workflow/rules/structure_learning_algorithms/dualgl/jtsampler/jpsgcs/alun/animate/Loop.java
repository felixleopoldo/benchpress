package jpsgcs.alun.animate;

import jpsgcs.alun.util.SafeThread;
import jpsgcs.alun.util.SafeRunnable;

public class Loop
{
	public Loop(SafeRunnable s)
	{
		t = new SafeThread(s);
		t.safeStart();
		t.safeSuspend();
	}

	public void start()
	{
		t.safeResume();
	}

	public void stop()
	{
		t.safeSuspend();
	}

	public void flip()
	{
		t.safeFlip();
	}

	public void finish()
	{
		t.safeStop();
	}

	public boolean isRunning()
	{
		return t.isRunning();
	}

	public Thread getThread()
	{
		return t;
	}

// Private data and methods and classes.

	private SafeThread t = null;
}
