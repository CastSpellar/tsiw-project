//Page Directives

<%@ page language="java" %>
<%@ page import="javax.xml.parsers.*" %>
<%@ page import="org.w3c.dom.Document" %>
<%@ page import="org.w3c.dom.Element" %>
<%@ page import="org.w3c.dom.DOMException" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.IOException" %>


//Page Variables

<%! String fileRoot = "e:/www/testpro/";%>
<%! String root = "http://your_site/testpro/";%>
<%! String dataRoot = "http://your_site/testpro/data/";%>
<%! String fileName= dataRoot + "userTable.xml";%>

<jsp:useBean id="logon" scope="session" class="logonBean.logon" />

<%! String msg="Parse Successful!";%>
<%! String nodeValue="No Value";%>
<%! String userID="";%>
<%! String pwd = "";%>
<%! String routeURL="";%>
<%! int listLength;%>


//HTML Header


<html>
<head>
<title>processLogon</title>
</head>
<body>

//Init Page

<%

	//Get page parameters:
	if(request.getParameter("userID") != null)
	{
		userID = request.getParameter("userID");
	}	

	if(request.getParameter("pwd") != null)
	{
		pwd = request.getParameter("pwd");
	}	

	//Declare variables
	Document document;
	DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
	
	//Initialise variables:
	msg="Parse Successful!";
	routeURL = "default.htm";
	
//Read XML file

try {
	//Open the file for reading:
URL u = new URL(fileName);
	InputStream inputXML = u.openStream();
	   
	//Build document:
	DocumentBuilder builder = factory.newDocumentBuilder();
       	document = builder.parse(inputXML);
		
	//Generate the NodeList;
	org.w3c.dom.NodeList nodeList = document.getElementsByTagName("user");
	listLength = nodeList.getLength();
		

//Search for User's Record

	outer:

	for (int i=0; i<nodeList.getLength(); i++) 
	{
		org.w3c.dom.Node curNode = nodeList.item(i);	

		//Get userID attribute:
					Element curElm = (Element)nodeList.item(i);
					String curUserID = curElm.getAttribute("userID");

		//Get pwd attribute:
		String curPwd = curElm.getAttribute("pwd");


		if (curUserID.equals(userID) && curPwd.equals(pwd))
		{
			routeURL = "frame.htm";
			logon.setUserID(userID);
			logon.setSecure();
			break outer;
		} //end if
	}//end for				



//Exception Handling

}catch(Exception e)
{
msg = msg + e.toString();
}

	
%>

//Page Routing

<script language="javascript">setTimeout("document.location='<%=routeURL%>'",100)</script>

</body>
</html>
