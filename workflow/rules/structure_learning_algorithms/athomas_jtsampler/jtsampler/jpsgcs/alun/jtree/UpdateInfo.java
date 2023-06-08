package jpsgcs.alun.jtree;

public class UpdateInfo<V> 
{
	public V x = null;
	public V y = null;
	public Clique<V> Cx = null;
	public Clique<V> Cy = null;
	public Clique<V> Cxy = null;
	public Separator<V> S = null;
	public double Aij = 0;
	public int type = 0;
	public int errcode = 0;
}
