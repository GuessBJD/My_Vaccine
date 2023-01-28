<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="com.dao.Vacc_centerDao" %>
<jsp:useBean id="vc" class="com.dao.bean.Vacc_center"></jsp:useBean>
<jsp:setProperty property="*" name="vc"/>

<%

	if(session.getAttribute("user") == null)
	{
		response.sendRedirect("invalidUserSession.html");
	}else{
		int i = Vacc_centerDao.save(vc);
	
		if(i>0){
			response.sendRedirect("vaccSpotManager.jsp");	
			
		}else{
			response.sendRedirect("addSpot-error.jsp");
		}
	}
%>
</body>
</html>