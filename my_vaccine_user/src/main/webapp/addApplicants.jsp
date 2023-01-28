<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Applicant</title>
</head>
<body>

<%@ page import="com.dao.ApplicantDao" %>
<jsp:useBean id="u" class="com.dao.bean.Applicant"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
  
<%
    int a=ApplicantDao.getApplicantbyIc(u);

	if (a > 0)
	{
		
		response.sendRedirect("Registered.html");
	}
	else
	{
		session.setAttribute("ic", request.getParameter("ic"));
		response.sendRedirect("addAppointment.jsp");
	}	
%>

</body>
</html>