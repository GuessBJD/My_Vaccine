<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search applicant vaccination record</title>
</head>
<body>

<%@page import="com.dao.Applicant_vacc_statusDao, com.dao.bean.Applicant_vacc_status, java.util.*" %>
<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>


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
		<td><a href="applicantVaccRecManager.jsp"><h2>Applicant's vaccination record manager</h2></a></td>	
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

	if(session.getAttribute("user") == null){
		response.sendRedirect("invalidUserSession.html");
	}
	else{
		Applicant_vacc_status res = null;
		
		if(request.getParameter("search") == null && session.getAttribute("sessionUpdate") == null){
			response.sendRedirect("error.jsp?error=Session+error&backtrace=---+searchApplicantVaccRec.jsp+---");
		}

		if(session.getAttribute("sessionUpdate") != null){
			res = Applicant_vacc_statusDao.getRecordByIcNo((String)session.getAttribute("sessionUpdate"));
			session.removeAttribute("sessionUpdate");
			request.setAttribute("rec", res);
		}
			
		if(request.getParameter("search") != null){
			res = Applicant_vacc_statusDao.getRecordByIcNo(request.getParameter("search"));
			request.setAttribute("rec", res);
		}	
		
	}						

%>

<table border="1" width="100%">

	 <tr>
	 	<th>IC No.</th>
	 	<th>Name</th>
	 	<th>1st Dose</th>
	 	<th>2nd Dose</th>
	 	<th></th>
	 </tr>
 
 	 <core:if test="${rec != null}">
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
 	 </core:if>

 	 <core:if test="${rec == null}">
	 	 <p>Empty query returned :(</p>
	 	 <tr>
		 	<td>N/A</td>
		 	<td>N/A</td>
		 	<td>N/A</td>
		 	<td>N/A</td>
		 	<td><input type="button" value="Update"></td>
		 </tr>
 	 </core:if>
</table>

</body>
</html>