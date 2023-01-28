<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Vaccination manager</title>
</head>

<body>

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
		<td><a href="#"><h2>Vaccination Manager</h2></a></td>
	</tr>
</table>


<table border="1" width="100%">
	<tr>
		<td>Applicant's vaccination</td>
		<td><a href="applicantVaccRecManager.jsp"><button>Manage</button></a></td>
	</tr>
	<tr>
		<td>Applicant vaccination appointment</td>
		<td><a href="applicantAppointmentManager.jsp"><button>Manage</button></a></td>
	</tr>
</table>

</body>

</html>