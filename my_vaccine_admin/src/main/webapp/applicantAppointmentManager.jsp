<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Applicant appointment manager</title>
</head>
<body>

<%
	if(session.getAttribute("user") == null){
		response.sendRedirect("invalidUserSession.html");
	}
%>

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
		<td><a href="#"><h2>Applicant appointment manager</h2></a></td>	
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
			<td style="text-align: center;">
				<label>
					<input type="radio" name="doseNum" value="1" checked="checked" />Dose one
					<input type="radio" name="doseNum" value="2" />Dose two
				</label>				
			</td>
			<td style="text-align: center;"><input type="submit" value="Search"/></td>
		</tr>
	</table>
</form>



</body>
</html>