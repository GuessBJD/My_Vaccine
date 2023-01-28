<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Assign date</title>
</head>
<body>

<%@page import="com.dao.AppointmentDao, com.dao.bean.Appointment, java.util.*, java.sql.Date" %>

<%

	if(session.getAttribute("user") == null){
		response.sendRedirect("invalidUserSession.html");
	}
	else{
		
		if(session.getAttribute("list") != null){
			
			List<Appointment> list = (List<Appointment>)session.getAttribute("list");
			Date assigningDate = Date.valueOf(request.getParameter("date"));
			int assigningNum = Integer.parseInt(request.getParameter("num"));
			int doseNum = Integer.parseInt(request.getParameter("doseNum"));
			
			int i = com.dao.AppointmentDao.assignByList(list, assigningNum, assigningDate, doseNum);
				
			response.sendRedirect("assignDateResult.jsp");
			
		}
		else{
			response.sendRedirect("error.jsp?error=Session+error&backtrace=---+assignDate.jsp+---");
		}
				
	}

%>

</body>
</html>