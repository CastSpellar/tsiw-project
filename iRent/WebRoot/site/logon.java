package logonBean;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public class logon 
{

    // Variables
	String userID = "";
	boolean secure = false;

		
	public String getUserID()
	{
		return userID;
	}

	public void setUserID(String userID)
	{
		this.userID = userID;
	}

	public void setSecure()
	{
		secure = true;
	}

	public boolean getSecure()
	{
		return secure;
	}

	
}
