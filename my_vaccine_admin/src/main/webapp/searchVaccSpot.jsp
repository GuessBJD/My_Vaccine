<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Vaccination Spot</title>
</head>
<body>
<%@page import="com.dao.Vacc_centerDao, com.dao.bean.Vacc_center, java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	if(session.getAttribute("user") == null)
	{
		response.sendRedirect("invalidUserSession.html");
	}
	
	String state = new String();
	String district = new String();
	String vacc_center = new String();
	if(request.getParameter("state") != null && request.getParameter("district") != null && request.getParameter("vacc_center") != null)
	{
		state = request.getParameter("state");
		district = request.getParameter("district");
		vacc_center = request.getParameter("vacc_center");
		List<Vacc_center>list=Vacc_centerDao.getResultBySearchAll(state, district, vacc_center);
		request.setAttribute("list", list);
	}
	
	if(request.getParameter("state") != null && request.getParameter("district").equals("Select District") && request.getParameter("vacc_center").equals("Select Vaccination Center"))
	{
		state = request.getParameter("state");
		List<Vacc_center>list=Vacc_centerDao.getResultBySearchState(state);
		request.setAttribute("list", list);
	}
	
	if(request.getParameter("state") != null && !request.getParameter("district").equals("Select District") && request.getParameter("vacc_center").equals("Select Vaccination Center"))
	{
		state = request.getParameter("state");
		district = request.getParameter("district");
		List<Vacc_center>list=Vacc_centerDao.getResultBySearchStateDistrict(state, district);
		request.setAttribute("list", list);
	}
%>

<table	width="100%">
	<tr>
		<td>
			<a href="adminPortal.jsp"><h1>Admin Portal</h1></a>		
		</td>	
		<td style="text-align: right">
			<a href="adminLogout.jsp">Log out</a>
		</td>
	</tr>
</table>

<table>
	<tr>
		<td><a href="vaccSpotManager.jsp"><h2>Vaccination Spot Manager</h2></a></td>
	</tr>
</table>

<form action="vaccSpotManager.jsp" method="post">
	<input type="submit" value="Back to full list"/>
</form>

<br/>

<table border="1" width="100%">
	<tr>
		<th>CenterId</th>
		<th>Center Name</th>
		<th>State</th>
		<th>District</th>
		<th>Address</th>
		<th>Edit</th>
		<th>Delete</th>
		
	</tr>

<c:forEach items="${list}" var="vc">
	<tr>
		<td style="text-align: center;">${vc.getCenter_id()}</td>
		<td style="text-align: center;">${vc.getCenter_name()}</td>
		<td style="text-align: center;">${vc.getState()}</td>
		<td style="text-align: center;">${vc.getDistrict()}</td>
		<td style="text-align: center;">${vc.getAddress()}</td>
		
		<td>
			<form action="editVaccSpotForm.jsp" method="post" style="text-align: center;">
			<input type="hidden" name="center_id" value="${vc.getCenter_id()}"/>
			<input type="submit" value="Edit">
			</form>
		</td>
		
		
		<td>
			<form action="deleteVaccSpot.jsp" method="post" style="text-align: center;">
			<input type="hidden" name="center_id" value="${vc.getCenter_id()}"/>
			<input type="submit" value="Delete"/>
			</form>
		</td>
		
	</tr>
</c:forEach>

</table>
</body>
</html>