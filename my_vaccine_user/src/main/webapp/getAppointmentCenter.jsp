<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Get Appointment</title>
</head>
<body>
<%@ page import="com.dao.ApplicantDao" %>
	<jsp:useBean id="u" class="com.dao.bean.Applicant"></jsp:useBean>
	<jsp:setProperty property="*" name="u"/>

<%@ page import="com.dao.AppointmentDao" %> 
 

<%@ page import="com.dao.Applicant_vacc_statusDao" %>
   <jsp:useBean id="u2" class="com.dao.bean.Applicant_vacc_status"></jsp:useBean>
   <jsp:setProperty property="*" name="u2"/>
   
<%@ page import="java.sql.Date" %>

<%
    String ic = (String) request.getSession().getAttribute("ic");
    u.setIc(ic);

	Date vacc_date = Date.valueOf(request.getParameter("firstdose"));
	int i=ApplicantDao.insert(u);
	int j=AppointmentDao.insertAppointment(request.getParameter("name"), ic, request.getParameter("vacc_center"), request.getParameter("vacc_choice"), vacc_date);
	int k=Applicant_vacc_statusDao.insertApplicant(request.getParameter("name"), ic);
	if ((i>0) && (j>0) && (k>0))
	{
		request.getSession().setAttribute("ic", ic);
		response.sendRedirect("addApplicants-success.jsp");
	}
	else
	{
		response.sendRedirect("addAppointment-error.jsp");
	}
	
%>

</body>
</html>