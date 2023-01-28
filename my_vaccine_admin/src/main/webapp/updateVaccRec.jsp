<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update vaccination record</title>
</head>
<body>

<%@page import="com.dao.Applicant_vacc_statusDao, java.util.*" %>


<%

	if(session.getAttribute("user") == null){
		response.sendRedirect("invalidUserSession.html");
	}
	else{
		if(request.getParameter("icNo") != null){
			
			String icNo = request.getParameter("icNo");
			boolean firstDose = Boolean.parseBoolean(request.getParameter("1stDose"));
			boolean secondDose = Boolean.parseBoolean(request.getParameter("2ndDose"));
				
			int i = com.dao.Applicant_vacc_statusDao.update(icNo, firstDose, secondDose);
			
			session.setAttribute("sessionUpdate", icNo);
			
			response.sendRedirect("searchApplicantVaccRec.jsp");
			
		}
		else{
			response.sendRedirect("error.jsp?error=Unassigned+request+parameter&backtrace=---+updateVaccRec.jsp+---");	
		}		
	}	
%>

</body>
</html>