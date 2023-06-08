package jpsgcs.alun.viewgraph;

import jpsgcs.alun.animate.Loop;

import java.awt.MenuItem;
import java.awt.Menu;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class RunMenu extends Menu
{
	public RunMenu(Loop l)
	{
		super("Positioning");

		MenuItem item = new MenuItem("Run");
		item.addActionListener(new Starter(l));
		add(item);

		item = new MenuItem("Stop");
		item.addActionListener(new Stopper(l));
		add(item);
	}
}

class Stopper implements ActionListener
{
	public Stopper(Loop l)
	{
		loop = l;
	}

	public void actionPerformed(ActionEvent e)
	{
		loop.stop();
	}

	private Loop loop = null;
}

class Starter implements ActionListener
{
	public Starter(Loop l)
	{
		loop = l;
	}

	public void actionPerformed(ActionEvent e)
	{
		loop.start();
	}

	private Loop loop = null;
}
