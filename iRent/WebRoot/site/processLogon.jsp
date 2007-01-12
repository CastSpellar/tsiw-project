<%@ page language="java" %>
<%@ page import="javax.xml.parsers.*" %>
<%@ page import="org.w3c.dom.Document" %>
<%@ page import="org.w3c.dom.Element" %>
<%@ page import="org.w3c.dom.DOMException" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.IOException" %>
<%@ page import="org.xmldb.api.base.Resource" %>
<%@ page import="org.xmldb.api.modules.XMLResource" %>

<jsp:useBean id="logon" scope="session" class="logonBean.logon" />
<jsp:useBean id="dbGet" scope="session" class="eXistPackage.dbGet" />

<%! String msg="Parse Successful!";%>
<%! String nodeValue="No Value";%>
<%! String userID="";%>
<%! String pwd = "";%>
<%! String routeURL="";%>
<%! int listLength;%>

<html>
<head>
<title>processLogon</title>
</head>
<body>
<%
	//Get page parameters:
	if(request.getParameter("userID") != null){
		userID = request.getParameter("userID");
	}	
	if(request.getParameter("pwd") != null){
		pwd = request.getParameter("pwd");
	}	

	//Initialise variables:
	msg="Parse Successful!";
	routeURL = "error.html";
	
//Read XML file
try {
	//Open the file for reading:
	Resource xml = dbGet.getResource("/db/iRent/users","userTable.xml");
%> <%=xml.getContent() %> <%		
	//Generate the NodeList;
	//org.w3c.dom.NodeList nodeList = document.getElementsByTagName("user");
	org.w3c.dom.NodeList nodeList = (((XMLResource) xml.getContent()).getContentAsDOM()).getChildNodes();
	listLength = nodeList.getLength();	

	//Search for User's Record
	outer:

	for (int i=0; i<nodeList.getLength(); i++) 
	{
		org.w3c.dom.Node curNode = nodeList.item(i);
		
					Element curElm = (Element)nodeList.item(i);
					String curUserID = curElm.getAttribute("userID");

		String curPwd = curElm.getAttribute("pwd");

		if (curUserID.equals(userID) && curPwd.equals(pwd))
		{
			routeURL = "main.jsp";
			logon.setUserID(userID);
			logon.setSecure();
			break outer;
		} 
	}
	
}catch(Exception e)
{
msg = msg + e.toString();
}	
%>


</body>
</html>
