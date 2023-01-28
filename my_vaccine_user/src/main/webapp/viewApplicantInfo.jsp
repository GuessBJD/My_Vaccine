<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>View Applicant Info (after registered)</title>
	
	<link href="BSS/css/bootstrap.min.css" rel="stylesheet">
	<link href="resources/addApplicantSuccess.css" rel="stylesheet" type="text/css">
		
</head>
	<body>
		
		<%@ page import="com.dao.ApplicantDao" %>
		<jsp:useBean id="u" class="com.dao.bean.Applicant"></jsp:useBean>
		<jsp:setProperty property="*" name="u"/>

		<%@ page import="com.dao.AppointmentDao" %> 
		<jsp:useBean id="u1" class="com.dao.bean.Appointment"></jsp:useBean>
		<jsp:setProperty property="*" name="u1"/>

		<% 
			String ic = (String) request.getSession().getAttribute("ic");
			u.setIc(ic);
			u1.setIc(ic);
		
		    int a=ApplicantDao.getApplicantbyIc(u);
		    int j=AppointmentDao.getAppointmentbyIc(u1);
		    String gender="";
		    if (u.getGender() == 0)
		    {
		    	gender = "Female";
		    }
		    else
		    {
		    	gender = "Male";
		    }  
		%>
		
		
		<h3>Applicant Vaccination Info</h3>
		
			<table align="center" class="view-info">
				
				<tr>
					<td>Applicant Ic No.: </td>
					<td>${u.getIc()}</td>
				</tr>
		
				<tr>
					<td>Applicant Name: </td>
					<td>${u.getName()}</td>
				</tr>		
				
				<tr>
					<td>Gender: </td>
					<td> <%=gender%></td>
				</tr>
				
				<tr>
					<td>Phone: </td>
					<td>${u.getPhone()}</td>
				
				</tr>
				
				<tr>
					<td>Email: </td>
					<td>${u.getEmail()}</td>
				</tr>
				
				<tr>
					<td>Vaccination Center: </td>
					<td>${u1.getVaccCenter()}</td>
				</tr>
				
				<tr>
					<td>Vaccination Choice: </td>
					<td>${u1.getVaccChoice()}</td>
				</tr>
				
				<tr>	
					<td>First Dose Date: </td>
					<td>${u1.getFirstdose()}</td>
				</tr>
		
			</table>	   	
	
	</body>
</html>