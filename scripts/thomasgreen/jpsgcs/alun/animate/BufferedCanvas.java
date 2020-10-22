package jpsgcs.alun.animate;

import java.awt.Canvas;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.Dimension;
import java.awt.event.ComponentListener;
import java.awt.event.ComponentEvent;

public class BufferedCanvas extends Canvas implements ComponentListener
{
	public BufferedCanvas(Paintable p)
	{
		setSize(100,100);
		painter = p;
		addComponentListener(this);
	}

	public void paint(Graphics g)
	{
		if (painter != null)
			painter.paint(g);
	}

	public void update(Graphics g)
	{
		// Create a buffer image.
		Dimension d = getSize();
		if (ima == null || ima.getHeight(null)!=d.height || ima.getWidth(null)!=d.width)
			ima = createImage(d.width,d.height);

		// Draw a background to the image.
		Graphics gg = ima.getGraphics();
		gg.setColor(getBackground());
		gg.fillRect(0,0,d.width,d.height);

		// Paint the background image.
		paint(gg);
			
		// Flash the image to the screen.
		g.drawImage(ima,0,0,null);

		// Clean up.
		gg.dispose();
	}

	public Paintable getPainter()
	{
		return painter;
	}

	public void setPainter(Paintable p)
	{
		painter = p;
	}

	public void componentHidden(ComponentEvent e)
	{
		repaint();
	}

	public void componentMoved(ComponentEvent e)
	{
		repaint();
	}

	public void componentResized(ComponentEvent e)
	{
		repaint();
	}

	public void componentShown(ComponentEvent e)
	{
		repaint();
	}

// Private data.

	private Image ima = null;
	private Paintable painter = null;
}
