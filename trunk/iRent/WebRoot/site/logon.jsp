<%@ page language="java" %>
<html>
<head>
<title>Logon</title>
<link href="default.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="wrapper">
	<div id="content">
		<div id="colOne">
			<center>			
				<form method="POST" action="processLogon.jsp" name="conform">
					<table border="0" cellpadding="0" cellspacing="0" width="200">
						<tr>
						<td width="50%">Name</td>
							<td width="50"><input type="text" name="userID" size="16"></td>
						</tr>
						<tr>
							<td width="50%">Password</td>
							<td width="50%"><input type="password" name="pwd" size="16"></td>
						</tr>
						
						<tr>
							<td width="50%" colspan="2" align="center">
								<input type="submit"  value="submit" size="16">
							</td>
						</tr>
					</table>
				</form>
			</center>
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
</html>
