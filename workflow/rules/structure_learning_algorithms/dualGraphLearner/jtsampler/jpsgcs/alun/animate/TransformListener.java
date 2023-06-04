package jpsgcs.alun.animate;

import java.awt.Canvas;
import java.awt.geom.AffineTransform;
import java.awt.event.KeyEvent;
import java.awt.event.MouseEvent;
import java.awt.event.InputEvent;
import java.awt.Dimension;

class TransformListener extends MouseKeyListener
{
	public TransformListener(Canvas c, AffineTransform a)
	{
		canv = (ActiveCanvas) c;
		trans = a;
	}

	public void keyPressed(KeyEvent e)
	{
		if (e.isShiftDown() || e.isControlDown())
			return;

		switch(e.getKeyCode())
		{
		case KeyEvent.VK_HOME:
			trans.setToIdentity();
			if (canv.centered)
			{
				Dimension d = canv.getSize();
				trans.translate(d.width/2,d.height/2);
			}
			else
			{
				trans.translate(canv.offset,canv.offset);
			}
			break;
		case KeyEvent.VK_DOWN:
			trans.scale(zoomout,zoomout);
			break;
		case KeyEvent.VK_UP:
			trans.scale(zoomin,zoomin);
			break;
		case KeyEvent.VK_LEFT:
			trans.rotate(theta);
			break;
		case KeyEvent.VK_RIGHT:
			trans.rotate(-theta);
			break;
		}

		canv.repaint();
	}
	
	public void mouseEntered(MouseEvent e)
	{
		canv.requestFocusInWindow();
	}

	public void mouseExited(MouseEvent e)
	{
	}

	public void mousePressed(MouseEvent e)
	{
		if (e.isShiftDown() || e.isControlDown())
			return;

		switch(button(e))
		{
		case 3: x = e.getX();
			y = e.getY();
			shift = true;
		}
	}

	public void mouseReleased(MouseEvent e)
	{
		if (shift)
		{
			trans.translate(e.getX()-x,e.getY()-y);
			canv.repaint();
			shift = false;
		}
	}

	public void mouseDragged(MouseEvent e)
	{
		if (shift)
		{
			trans.translate(e.getX()-x,e.getY()-y);
			canv.repaint();
		}
	}

// Private data and methods.

	private ActiveCanvas canv = null;
	private AffineTransform trans = null;

	private double zoomout = 9.0/10;
	private double zoomin = 1.0/zoomout;
	private double theta = Math.PI/12.0;

	private int x = 0;
	private int y = 0;
	private boolean shift = false;
}
