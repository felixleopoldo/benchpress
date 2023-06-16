package jpsgcs.alun.util;

import java.util.StringTokenizer;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.InputStream;
import java.util.StringTokenizer;
import java.io.FileReader;

/**
 This class lets the programmer read input in a formatted way.
*/
public class InputFormatter
{
/** 
 Creates a new input formatter by opening a file with the given file name
 using the characters in the other string as field delimitors.
 If the given file name is null, the standard input stream is used instead.
 If the delimitor string is null, the built in defaults of StringTokenizer are used. 

 As an example the following will access all the integers in a 
 file of unknown length and find the sum.

	int total = 0;
	InputFormatter f = new InputFormatter(new BufferedReader(new InputStreamReader(System.in)));
	while (f.newLine())
	{
		while (f.newToken())
		{
			total += f.getInt();
		}
	}
	
*/

	public InputFormatter() throws IOException
	{
		this(new BufferedReader(new InputStreamReader(System.in)));
	}

	public InputFormatter(InputStream s) throws IOException
	{
		this(new BufferedReader(new InputStreamReader(s)));
	}

	public InputFormatter(InputStream s, String del) throws IOException
	{
		this(new BufferedReader(new InputStreamReader(s)),del);
	}

	public InputFormatter(String s) throws IOException
	{
		this(new BufferedReader(new FileReader(s)));
	}

	public InputFormatter(BufferedReader br) throws IOException
	{
		this(br,null);
	}

	public InputFormatter(BufferedReader br, String del) throws IOException
	{
		b = br;
		delim = del;
		line = 0;
	}

/**
 Skips the remainder of the current input line. If there is 
 another line it returns true, otherwise false.
*/
	public boolean newLine() throws IOException
	{
		String s = b.readLine();
		line++;
		if (s == null)
			return false;
		if (delim == null)
			t = new StringTokenizer(s);
		else
			t = new StringTokenizer(s,delim);

		token = 0;
		thisline = s;
		return true;	
	}

	public String nextLine() throws IOException
	{
		return newLine() ? thisline : null;
	}

/**
 Reads the next line, but resets to the current mark so that
 the next newLine() will re-read the line that is returned here.
*/
	public String peekLine(int readAheadLimit) throws IOException
	{
		b.mark(readAheadLimit);
		String s = b.readLine();
		b.reset();
		return s;
	}

/**
 Skips to the next token in the current line. If there is
 another token it returns true, otherwise false.
*/
	public boolean newToken() 
	{
		if (t.hasMoreTokens())
		{
			tok = t.nextToken();
			token++;
			return true;
		}
		else
		{
			return false;
		}
	}

/**
 Returns the number of items remaining on the current line.
*/
	public int itemsLeftOnLine()
	{
		return t.countTokens();
	}

/**
 Returns the value of the current token as an int.
*/
	public int getInt() 
	{
		return (new Integer(tok)).intValue();
	}

/**
 Returns true only if the next token can be correctly read as an int.
*/
	public boolean nextIsInt()
	{
		boolean good = true;
		try
		{
			new Integer(tok).intValue();
		}
		catch (NumberFormatException e)
		{
			good = false;
		}
		return good;
	}
		
/**
 Returns the value of the current token as a double.
*/
	public double getDouble()
	{
		return (new Double(tok)).doubleValue();
	}

/**
 Returns true only if the next token can be correctly read as a double.
*/
	public boolean nextIsDouble()
	{
		boolean good = true;
		try
		{
			new Double(tok).doubleValue();
		}
		catch (NumberFormatException e)
		{
			good = false;
		}
		return good;
	}

/**
 Returns the value of the current token as a String.
*/
	public String getString()
	{
		return tok;
	}

/**
 Advances to the next token and returns it as an integer.
 No checks are made to ensure that this makes sense to do.
*/
	public int nextInt()
	{
		if (newToken())
			return (new Integer(tok)).intValue();
		else
			return 0;
	}

	public long nextLong()
	{
		if (newToken())
			return (new Integer(tok)).longValue();
		else
			return 0;
	}

/**
 Advances to the next token and returns it as a double.
 No checks are made to ensure that this makes sense to do.
*/
	public double nextDouble()
	{
		if (newToken())
			return (new Double(tok)).doubleValue();
		else
			return 0;
	}

	public String nextString()
	{
		if (newToken())
			return tok;
		else
			return null;
	}
	
/**
 Returns the remainder of the current line as a string and
 skips to the end of the line. Does not move on to the next line.
*/
	public String restOfLine()
	{
		token += t.countTokens();
		if (t.hasMoreTokens())
		{
			return t.nextToken("\n");
		}
		else
			return "";
	}

	public int lineLength()
	{
		return thisline.length();
	}

	public String thisLine()
	{
		return thisline;
	}

	public int lineNumber()
	{
		return line;
	}

	public int lastLine()
	{
		return line;
	}

	public int lastToken()
	{
		return token;
	}
		
// Priate data.

	private int line = 0;
	private int token = 0;
	private BufferedReader b = null;
	private StringTokenizer t = null;
	private String tok = null;
	private String delim = null;
	private String thisline = null;
}
