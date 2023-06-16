package jpsgcs.alun.animate;

import jpsgcs.alun.markov.Parameter;
import java.awt.event.AdjustmentEvent;
import java.awt.event.AdjustmentListener;

public class ParameterScrollWidget extends ScrollWidget
{
	public ParameterScrollWidget(Parameter p)
	{
		super(p.name(), p.max(), p.def());
		par = p;
	}
		
	public void adjustmentValueChanged(AdjustmentEvent e)
	{
		super.adjustmentValueChanged(e);
		if (e != null)
			par.setValue(getRealValue());
	} 

	public Parameter getParameter()
	{
		return par;
	}

	public void setParameterValue(double t)
	{
		setRealValue(t);
		par.setValue(t);
	}

	private Parameter par = null;
}
