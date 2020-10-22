package jpsgcs.alun.animate;

import java.awt.PageAttributes;
import java.awt.PageAttributes.MediaType;
import java.awt.PageAttributes.PrintQualityType;
import java.awt.PageAttributes.ColorType;
import java.awt.PageAttributes.OriginType;
import java.awt.PageAttributes.OrientationRequestedType;

public class PaperTypes
{
	public static PaperTypes[] list = 
	{
		null,
		new PaperTypes(PageAttributes.MediaType.LETTER, PageAttributes.OrientationRequestedType.PORTRAIT),
		new PaperTypes(PageAttributes.MediaType.LETTER, PageAttributes.OrientationRequestedType.LANDSCAPE),

		new PaperTypes(PageAttributes.MediaType.A4, PageAttributes.OrientationRequestedType.PORTRAIT),
		new PaperTypes(PageAttributes.MediaType.A4, PageAttributes.OrientationRequestedType.LANDSCAPE),

		new PaperTypes(PageAttributes.MediaType.A3, PageAttributes.OrientationRequestedType.PORTRAIT),
		new PaperTypes(PageAttributes.MediaType.A3, PageAttributes.OrientationRequestedType.LANDSCAPE),

		new PaperTypes(PageAttributes.MediaType.A2, PageAttributes.OrientationRequestedType.PORTRAIT),
		new PaperTypes(PageAttributes.MediaType.A2, PageAttributes.OrientationRequestedType.LANDSCAPE),

		new PaperTypes(PageAttributes.MediaType.A1, PageAttributes.OrientationRequestedType.PORTRAIT),
		new PaperTypes(PageAttributes.MediaType.A1, PageAttributes.OrientationRequestedType.LANDSCAPE),

		new PaperTypes(PageAttributes.MediaType.A0, PageAttributes.OrientationRequestedType.PORTRAIT),
		new PaperTypes(PageAttributes.MediaType.A0, PageAttributes.OrientationRequestedType.LANDSCAPE),

		new PaperTypes(PageAttributes.MediaType.C1, PageAttributes.OrientationRequestedType.PORTRAIT),
		new PaperTypes(PageAttributes.MediaType.C1, PageAttributes.OrientationRequestedType.LANDSCAPE),

		new PaperTypes(PageAttributes.MediaType.C0, PageAttributes.OrientationRequestedType.PORTRAIT),
		new PaperTypes(PageAttributes.MediaType.C0, PageAttributes.OrientationRequestedType.LANDSCAPE)
	};

	private PaperTypes(PageAttributes.MediaType paper, PageAttributes.OrientationRequestedType orient)
	{
		pa = new PageAttributes();
		pa.setPrintQuality(PageAttributes.PrintQualityType.NORMAL);
		pa.setColor(PageAttributes.ColorType.COLOR);
		pa.setOrigin(PageAttributes.OriginType.PHYSICAL);

		pa.setMedia(paper);
		pa.setOrientationRequested(orient);

		if (paper == PageAttributes.MediaType.A4)
		{
			name = "A4";
			height = (int)(72 / 2.54 * 29.7);
			width = (int)(72 / 2.54 * 21.0);
		}
		else if (paper == PageAttributes.MediaType.A3)
		{
			name = "A3";
			height = (int)(2*72 / 2.54 * 21.0);
			width = (int)(72 / 2.54 * 29.7);
		}
		else if (paper == PageAttributes.MediaType.A2)
		{
			name = "A2";
			height = (int)(2* 72 / 2.54 * 29.7);
			width = (int)(2* 72 / 2.54 * 21.0);
		}
		else if (paper == PageAttributes.MediaType.A1)
		{
			name = "A1";
			height = (int)(2*2*72 / 2.54 * 21.0);
			width = (int)(2*72 / 2.54 * 29.7);
		}
		else if (paper == PageAttributes.MediaType.A0)
		{
			name = "A0";
			height = (int)(2*2* 72 / 2.54 * 29.7);
			width = (int)(2*2* 72 / 2.54 * 21.0);
		}
		else if (paper == PageAttributes.MediaType.LETTER)
		{
			name = "Letter";
			height = (int)(72 * 11);
			width = (int)(72 * 8.5);
		}
		else if (paper == PageAttributes.MediaType.C0)
		{
			name = "C0";
			height = (int)(72 / 2.54 * 129.7);
			width = (int)(72 / 2.54 * 91.7);
		}
		else if (paper == PageAttributes.MediaType.C1)
		{
			name = "C1";
			height = (int)(72 / 2.54 * 91.7);
			width = (int)(72 / 2.54 * 64.8);
		}

		if (orient == PageAttributes.OrientationRequestedType.LANDSCAPE)
		{
			int t = width;
			width = height;
			height = t;
			name = name + " " + "Landscape";
		}
		else
		{
			name = name + " " + "Portrait";
		}
	}

	public PageAttributes getAttributes()
	{
		return pa;
	}

	public int getWidth()
	{
		return width;
	}

	public int getHeight()
	{
		return height;
	}

	public String getName()
	{
		return name;
	}

	public String toString()
	{
		return pa.toString();
	}

	private PageAttributes pa = null;
	private int width = 0;
	private int height = 0;
	private String name = null;
}
