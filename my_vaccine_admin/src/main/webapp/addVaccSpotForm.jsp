<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Vaccination Spot Form</title>
</head>
<body>
<%
	if(session.getAttribute("user") == null)
	{
		response.sendRedirect("invalidUserSession.html");
	}
%>

<h1>Admin Portal</h1>

<h2>Add new Vaccination Spot</h2>


<form action="addVaccSpot.jsp" method="post">

	<table>
	<tr>
		<td>Center Name: </td>
		<td><input type="text" name="center_name" ></td>
	</tr>
	
	<tr>
		<td>State: </td>
		<!--  <td><input type="text" name="state" ></td> -->
		<td>
			<input type="text" name="state" />
		</td>
	</tr>
	
	<tr>
		<td>District: </td>
		<td>
			<input type="text" name="district" />
		</td>
	</tr>

	<tr>
		<td>Address: </td>
		<td><input type="text" name="address" ></td>
	</tr>

	<tr>
		<td><input type="submit" value="Add Vaccination Spot"/></td>
		<td><a href="vaccSpotManager.jsp"><input type="button" value="Cancel"></a></td>
	</tr>
	
	</table>

</form>

</body>
</html>