package jpsgcs.alun.animate;

import java.awt.MenuItem;
import java.awt.Menu;
import java.awt.Frame;
import java.awt.Graphics;
import java.awt.Toolkit;
import java.awt.JobAttributes;
import java.awt.PrintJob;
import java.awt.CheckboxMenuItem;
import java.awt.Color;
import java.awt.event.ActionListener;
import java.awt.event.ItemListener;
import java.awt.event.ActionEvent;
import java.awt.event.ItemEvent;

public class PlotMenu extends Menu implements ItemListener, ActionListener
{
	public PlotMenu(Frame f, ActiveCanvas a)
	{
		super("Plotting");

		canvas = a;
		frame = f;

		Menu show = new Menu("Show page");
		add(show);
		
		boxes = new CheckboxMenuItem[papers.length];

		for (int i=0; i<boxes.length; i++)
		{
			if (papers[i] != null)
				boxes[i] = new CheckboxMenuItem(papers[i].getName());
			else
				boxes[i] = new CheckboxMenuItem("None");
			show.add(boxes[i]);
			boxes[i].addItemListener(this);
		}

		boxes[0].setState(true);

		CheckboxMenuItem ax = new CheckboxMenuItem("Axes");
		ax.addItemListener(new AxesSwitch(canvas));
		ax.setState(true);
		add(ax);

		MenuItem plot = new MenuItem("Output plot");
		plot.addActionListener(this);
		add(plot);
	}

	public void actionPerformed(ActionEvent e)
	{
		Toolkit t = Toolkit.getDefaultToolkit();
		if (t == null)
			throw new RuntimeException("Toolkit is null");

		PaperTypes p = canvas.getPaper();
		if (p == null)
			p = papers[1];

		PrintJob j = t.getPrintJob(frame,"Canvas plot",null,p.getAttributes());

		if (j == null)
		{
			System.err.println("Print job cancelled");
			return;
		}

		Graphics g = j.getGraphics();
		if (g == null)
			throw new RuntimeException("Graphics object is null");

		canvas.plot(g);
		g.dispose();
		j.end();

		canvas.repaint();
	}

	public void itemStateChanged(ItemEvent e)
	{
		for (int i=0; i<boxes.length; i++)
		{
			if (boxes[i] != e.getItemSelectable())
			{
				boxes[i].setState(false);
			}
			else
			{
				boxes[i].setState(true);
				canvas.setPaper(papers[i]);
			}
		}

		canvas.repaint();
	}

	private Frame frame = null;
	private ActiveCanvas canvas = null;
	private CheckboxMenuItem[] boxes = null;
	private static PaperTypes[] papers = PaperTypes.list;
}

class AxesSwitch implements ItemListener
{
	public AxesSwitch(ActiveCanvas c)
	{
		canvas = c;
	}

	public void itemStateChanged(ItemEvent e)
	{
		canvas.setAxes(((CheckboxMenuItem)e.getItemSelectable()).getState());
		canvas.repaint();
	}

	private ActiveCanvas canvas = null;
}

