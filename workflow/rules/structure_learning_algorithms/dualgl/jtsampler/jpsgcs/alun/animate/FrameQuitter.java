package jpsgcs.alun.animate;

import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

public class FrameQuitter extends WindowAdapter
{
	public void windowClosing(WindowEvent e)
	{
		System.exit(0);
	} 
}
