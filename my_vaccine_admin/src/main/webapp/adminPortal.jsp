<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Portal</title>
</head>
<body>

<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	if(session.getAttribute("user") == null)
	{
		response.sendRedirect("invalidUserSession.html");
	}
%>

<table	width="100%">
	<tr>
		<td>
			<a href="#"><h1>Admin Portal</h1></a>		
		</td>	
		<td style="text-align: right">
			<a href="adminLogout.jsp">Log out</a>
		</td>
	</tr>
</table>

<h2>Admin Portal Home</h2>

<table border="1" width="100%">
	<tr>
		<td>Vaccination Manager</td>
		<td><a href="vaccManager.jsp"><button>Manage</button></a></td>
	</tr>
	<tr>
		<td>Vaccination Spot Manager</td>
		<td><a href="vaccSpotManager.jsp"><button>Manage</button></a></td>
	</tr>
</table>


</body>
</html>