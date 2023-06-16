package jpsgcs.alun.viewgraph;

import java.awt.Graphics;
import java.awt.Color;

public interface VertexRepresentation
{
	public void paint(Graphics g, double x, double y, boolean b);
	
	public boolean contains(double x, double y);

	public void setColor(Color c);
} 
