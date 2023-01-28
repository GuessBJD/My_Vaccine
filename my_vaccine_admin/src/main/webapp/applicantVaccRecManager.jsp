<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Applicant vaccination record manager</title>
</head>
<body>

<%@page import="com.dao.Applicant_vacc_statusDao, com.dao.bean.Applicant_vacc_status, java.util.*" %>
<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	if(session.getAttribute("user") == null){
		response.sendRedirect("invalidUserSession.html");
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
		<td><a href="vaccManager.jsp"><h2>Vaccination Manager</h2></a></td>
		<td><h2>/</h2></td>
		<td><a href="#"><h2>Applicant's vaccination record manager</h2></a></td>		
	</tr>
</table>

<table>
	<tr>
		<td>Search by IC:</td>
	</tr>
	<tr>
		<td>
			<form action="searchApplicantVaccRec.jsp" method="post">
				<label for="search"><input type="text" id="search" name="search"/></label>
				<input type="submit" value="Search"/>
			</form>
		</td>
	</tr>
</table>
<br/>

<% 
	List<Applicant_vacc_status>list = Applicant_vacc_statusDao.getAllRec();
	request.setAttribute("recs", list);
%>

<table border="1" width="100%">
	 <tr>
	 	<th>IC No.</th>
	 	<th>Name</th>
	 	<th>1st Dose</th>
	 	<th>2nd Dose</th>
	 	<th></th>
	 </tr>
 
 	<core:forEach items="${recs}" var="rec">
	 	<tr>
	 		<td>${rec.getIc()}</td>
	 		<td>${rec.getName()}</td>
	 		<td>${rec.isFirstdose()}</td>
	 		<td>${rec.isSeconddose()}</td>
	 	
	 		<td>
	 			<form action="vaccRecEditor.jsp" method="post">
	 				<input type="hidden" name="ic" value="${rec.getIc()}"/>
	 				<input type="submit" value="Update"/>
	 			</form> 			
	 		</td>
	 	</tr>
 	</core:forEach>
 
</table>

</body>
</html>