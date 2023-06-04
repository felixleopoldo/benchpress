package jpsgcs.alun.animate;

import java.awt.Scrollbar;
import java.awt.event.AdjustmentEvent;
import java.awt.event.AdjustmentListener;
import java.awt.TextField;
import java.awt.Panel;
import java.awt.BorderLayout;
import jpsgcs.alun.util.StringFormatter;

public class ScrollWidget extends Scrollbar implements AdjustmentListener
{
	public ScrollWidget(String label, double scl, double init)
	{
		super(Scrollbar.HORIZONTAL);
		setValues(500,100,0,1100);
		setBlockIncrement(100);
		setUnitIncrement(1);
		addAdjustmentListener(this);

		lab = new TextField("",20);
		lab.setEditable(false);
		setLabel(label);

		dp = 3;
		box = new TextField("",5);
		box.setEditable(false);
		scaleBy(scl);
		setValue((int)(init/scale));
		adjustmentValueChanged(null);

		pan = new Panel();
		pan.setLayout(new BorderLayout());
		pan.add(lab,BorderLayout.WEST);
		pan.add(this,BorderLayout.CENTER);
		pan.add(box,BorderLayout.EAST);
	}

	public void adjustmentValueChanged(AdjustmentEvent e)
	{
		box.setText(StringFormatter.format(getRealValue(),dp));
	}

	public void scaleBy(double s)
	{
		scale *= s;
		adjustmentValueChanged(null);
	}

	public void setLabel(String s)
	{
		lab.setText(s);
	}

	public Panel getPanel()
	{
		return pan;
	}

	public double getRealValue()
	{
		return getValue()*scale;
	}

	public void setRealValue(double v)
	{
		setValue((int)(v/scale));
		adjustmentValueChanged(null);
	}

	public void setScale(double s)
	{
		scale = s;
	}

	private double scale = 0.001;
	private TextField lab = null;
	private Panel pan = null;
	private TextField box = null;
	private int dp = 3;
}
