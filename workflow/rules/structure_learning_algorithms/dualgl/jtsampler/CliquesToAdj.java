import jpsgcs.alun.util.InputFormatter;
import jpsgcs.alun.graph.Network;
import java.util.Vector;

public class CliquesToAdj
{
	public static void main(String[] args)
	{
		try
		{
			Network<String,Object> g = new Network<String,Object>();
			InputFormatter f = new InputFormatter();

			while (f.newLine())
			{
				Vector<String> v = new Vector<String>();
				while (f.newToken())
					v.add(f.getString());

				for (int i=0; i<v.size(); i++)
				{
					g.add(v.get(i));
					for (int j=i+1; j<v.size(); j++)
						g.connect(v.get(i),v.get(j));
				}
			}

			System.out.println(g);
		}
		catch (Exception e)
		{
			System.err.println("Caught in CliquesToAdj()");
			e.printStackTrace();
		}
	}
}
