<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Applicant</title>
</head>
<body>
<%@ page import="com.dao.ApplicantDao, com.dao.AppointmentDao, com.dao.Applicant_vacc_statusDao" %>
<jsp:useBean id="a" class="com.dao.bean.Applicant"></jsp:useBean>
<jsp:setProperty property="*" name="a"/>

<%
	int i = ApplicantDao.update(a);
	if (i>0)
	{ 
		AppointmentDao.UpdateName(a.getName(), a.getIc());
		Applicant_vacc_statusDao.UpdateName(a.getName(), a.getIc());
	}
	if(i>0)
	{
		response.sendRedirect("edit-success.jsp");
	}
	else
	{
		response.sendRedirect("edit-error.jsp");
	}
%>
</body>
</html>