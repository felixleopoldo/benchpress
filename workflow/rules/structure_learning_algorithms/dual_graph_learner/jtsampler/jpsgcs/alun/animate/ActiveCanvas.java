package jpsgcs.alun.animate;

import java.awt.Component;
import java.awt.Graphics;
import java.awt.Frame;
import java.awt.Graphics2D;
import java.awt.Dimension;
import java.awt.Image;
import java.awt.Color;
import java.awt.event.MouseEvent;
import java.awt.geom.AffineTransform;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Point2D;
import java.util.ConcurrentModificationException;

public class ActiveCanvas extends BufferedCanvas
{
	protected boolean centered = true;
	protected int offset = 20;
	private int defwd = 1000;
	private int defht = 1000;
	private boolean started = false;

	public ActiveCanvas(Paintable p)
	{
		super(p);
		setSize(defwd,defht);

		started = true;
		trans = new AffineTransform();
		
		Dimension d = getSize();
		trans.translate(d.width/2,d.height/2);

		addMouseKeyListener(new TransformListener(this,trans));
	}

	public void setCentered(boolean c)
	{
		centered = c;
		trans.setToIdentity();
		if (centered)
		{
			Dimension d = getSize();
			trans.translate(d.width/2,d.height/2);
		}
		else
		{
			trans.translate(offset,offset);
		}
	}

	public void addMouseKeyListener(MouseKeyListener m)
	{
		addMouseListener(m);
		addMouseMotionListener(m);
		addKeyListener(m);
	}

	public void removeMouseKeyListener(MouseKeyListener m)
	{
		removeMouseListener(m);
		removeMouseMotionListener(m);
		removeKeyListener(m);
	}

	public Graphics getGraphics() 
	{
		Graphics2D g = (Graphics2D) super.getGraphics();
		g.transform(trans);
		return g;
	}

	public void update(Graphics g)
	{
		try
		{
			// Create a buffer image.

			Dimension d = getSize();

			// Check for weirdness!
			if (d.height <= 0 || d.width <= 0)
			{
				setSize(defwd,defht);
				d = getSize();
				Component c = this;
                        	while (!(c instanceof Frame))
                                	c = c.getParent();
				((Frame)c).pack();
			}

			if (ima == null || ima.getHeight(null)!=d.height || ima.getWidth(null)!=d.width)
				ima = createImage(d.width,d.height);
	
			// Draw a background to the image.
			Graphics gg = ima.getGraphics();
			gg.setColor(getBackground());
			gg.fillRect(0,0,d.width,d.height);
	
			// Transform the coordinates.
			((Graphics2D)gg).transform(trans);
	
			// Paint the background image.
			paint(gg);
				
			// Flash the image to the screen.
			super.getGraphics().drawImage(ima,0,0,null);
	
			// Clean up.
			gg.dispose();
		}
		catch (ConcurrentModificationException e)
		{
			System.err.println("Caught in ActiveCanvas:update()");
			e.printStackTrace();
		}
	}

	public void paint(Graphics g)
	{
		try 
		{
			if (paper != null)
			{
				g.setColor(Color.white);
				g.fillRect(0,0,paper.getWidth(),paper.getHeight());
				g.setColor(Color.black);
				g.drawRect(0,0,paper.getWidth(),paper.getHeight());
				
			}
	
			if (axes)
			{
				int bigint = 10000;
				g.setColor(new Color(255,155,20));
				g.drawLine(0,0,0,bigint);
				g.drawLine(0,0,bigint,0);
				g.drawLine(0,0,0,-bigint);
				g.drawLine(0,0,-bigint,0);
			}
	
			super.paint(g);
		}
		catch (ConcurrentModificationException e)
		{
	//		System.err.println("Caught in ActiveCanvas:paint()");
	//		e.printStackTrace();
		}
	}

	public void plot(Graphics g)
	{
		super.paint(g);
	}

	public void setAxes(boolean b)
	{
		axes = b;
	}

	public void setPaper(PaperTypes p)
	{
		paper = p;
	}

	public PaperTypes getPaper()
	{
		return paper;
	}

	public AffineTransform getTransform()
	{
		return trans;
	}

// Protected methods.

	protected void processMouseEvent(MouseEvent ev)
	{
		try
		{
			super.processMouseEvent(transformed(ev));
		}
		catch (ConcurrentModificationException e)
		{
			System.err.println("Caught in ActiveCanvas:processMouseEvent()");
			e.printStackTrace();
		}
	}

	protected void processMouseMotionEvent(MouseEvent e)
	{
		super.processMouseMotionEvent(transformed(e));
	}

// Private data, methods and classes.

	private AffineTransform trans = null;
	private Image ima = null;
	private boolean axes = true;
	private PaperTypes paper = null;

	private MouseEvent transformed(MouseEvent e)
	{
		try
		{ 
			Point2D p = new Point2D.Double(e.getX(),e.getY());
			trans.inverseTransform(p,p);
			return new MouseEvent
			(
				(Component)e.getSource(),
				e.getID(),
				e.getWhen(),
				e.getModifiers(),
				(int)p.getX(),
				(int)p.getY(),
				e.getClickCount(),
				e.isPopupTrigger()
			);
		}
		catch (NoninvertibleTransformException f)
		{
			System.err.println("Caught in ActiveCanvas:transformed()");
			f.printStackTrace();
		}
		return e;
	}
}
