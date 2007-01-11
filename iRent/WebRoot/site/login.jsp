<%@ page language="java" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
<head>
    <html:base />
    <title>login.jsp</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="default.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="wrapper">
	<div id="content">
		<div id="colOne">
		    <html:form action="" method="post" focus="login">
		      <table border="0">
		        <tr>
		          <td>Login:</td>
		          <td><html:text property="login" /></td>
		        </tr>
		        <tr>
		          <td>Password:</td>
		          <td><html:password property="password" /></td>
		        </tr>
		        <tr>
		          <td colspan="2" align="center"><html:submit /></td>
		        </tr>
		      </table>
		    </html:form>
		</div>
		<div id="colTwo">
		</div>
		<div style="clear: both;">&nbsp;</div>
	</div>
	<div id="footer">
		<p>Copyright &copy; 2007 MaxOS Darker. Built by <strong><a href="http://code.google.com/p/tsiw-project/">Tiago ( Antao , Clemente )</a></strong></p>
	</div>
</div>		    
</body>
</html:html>
