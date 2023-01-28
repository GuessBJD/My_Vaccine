<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Appointment Date</title>
</head>
<body>

<%@page import="com.dao.AppointmentDao" %>

<%
	String ic = request.getParameter("ic");
	String name = request.getParameter("name");
	int dose  = Integer.parseInt(request.getParameter("dose"));
	int i = 0;

	if (dose ==1)
	{
		 i= AppointmentDao.CancelFirstDosebyIc(ic);
	}
	if (dose ==2)
	{
		i = AppointmentDao.CancelSecondDosebyIc(ic);
	}
	request.getSession().setAttribute("ic_del", ic);
	request.getSession().setAttribute("name_del", name);
	response.sendRedirect("View_Applicant.jsp");
%>

</body>
</html>