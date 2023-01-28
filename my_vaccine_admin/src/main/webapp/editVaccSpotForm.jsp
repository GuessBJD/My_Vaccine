<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Spot Form</title>
</head>
<body>
<%@page import="com.dao.Vacc_centerDao, com.dao.bean.Vacc_center" %>

<%
	if(session.getAttribute("user") == null)
	{
		response.sendRedirect("invalidUserSession.html");
	}
	
	String center_id = request.getParameter("center_id");
	Vacc_center vc = Vacc_centerDao.getRecordBycenter_Id(Integer.parseInt(center_id));
%>

<h1>Admin Portal</h1>

<h2>Edit Vaccination Spots Form</h2>


<form action="editVaccSpot.jsp" method="post">

	<input type="hidden" name="center_id" value="<%=vc.getCenter_id()%>"/>
	<table>
	<tr>
		<td>Center Name: </td>
		<td><input type="text" name="center_name" value="<%=vc.getCenter_name()%>"></td>
	</tr>
	
	<tr>
		<td>State: </td>
		<td><input type="text" name="state" value="<%=vc.getState()%>"></td>
		
	</tr>
	
	<tr>
		<td>District: </td>
		<td><input type="text" name="district" value="<%=vc.getDistrict()%>"></td>
	</tr>

	<tr>
		<td>Address: </td>
		<td><input type="text" name="address" value="<%=vc.getAddress()%>"></td>
	</tr>

	<tr>
		<td><input type="submit" value="Edit Vaccination Spot"/></td>
		<td><a href="vaccSpotManager.jsp"><input type="button" value="Cancel"></a></td>
	</tr>
	
	</table>

</form>


<script type="text/javascript" src="resources/stateCity.js"></script>
</body>
</html>