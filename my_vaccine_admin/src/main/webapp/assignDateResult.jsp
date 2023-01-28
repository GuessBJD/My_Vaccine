<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Assign date result</title>
</head>
<body>

<%@page import="com.dao.AppointmentDao, com.dao.bean.Appointment, java.util.*" %>
<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>

<table width="100%">
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
		<td><a href="applicantAppointmentManager.jsp"><h2>Applicant appointment manager</h2></a></td>	
	</tr>
</table>

<form action="searchAppointment.jsp" method="post">
	<table border="1" width=100%>
		<tr>
			<th>Vaccination center</th>
			<th>Vaccine choice</th>
			<th>Dose number</th>
			<th></th>
		</tr>
		<tr>
			<td style="text-align: center;"><label for="vacc_center"><input type="text" id="vacc_center" name="vacc_center" /></label></td>
			<td style="text-align: center;"><label for="vacc_choice"><input type="text" id="vacc_choice" name="vacc_choice" /></label></td>
			<td>
				<label>
					<input type="radio" name="doseNum" value="1" />Dose one
					<input type="radio" name="doseNum" value="2" />Dose two
				</label>				
			</td>
			<td><input type="submit" value="Search"/></td>
		</tr>
	</table>
</form>
<br />

<%

	if(session.getAttribute("user") == null){
		response.sendRedirect("invalidUserSession.html");
	}
	else{
		
		if(session.getAttribute("list") !=  null){
			List<Appointment> list = (List<Appointment>)session.getAttribute("list");
			
			List<Appointment> recs = AppointmentDao.getByList(list);
			
			request.setAttribute("recs", recs);
			session.removeAttribute("list");
		}
		else{
			response.sendRedirect("error.jsp?error=Session+error&backtrace=---+assignDateResult.jsp+---");
		}		
	}

%>

<table border="1" width="100%">

	 <tr>
	 	<th>Appointment No.</th>
	 	<th>IC No.</th>
	 	<th>Name</th>
	 	<th>Vaccination Center</th>
	 	<th>Vaccine Choice</th>
	 	<th>1st Dose Date</th>
	 	<th>2nd Dose Date</th>
	 </tr>
 
 	<core:forEach items="${recs}" var="rec">
	 	<tr>
	 		<td>${rec.getAppointment_id()}</td>
	 		<td>${rec.getIc()}</td>
	 		<td>${rec.getName()}</td>
	 		<td>${rec.getVacc_center()}</td>
	 		<td>${rec.getVacc_choice()}</td>
	 		<td>${rec.getFirstDose_Date()}</td> 
	 		<td>${rec.getSecondDose_Date()}</td> 	
	 	</tr>
 	</core:forEach>
 
</table>

</body>
</html>