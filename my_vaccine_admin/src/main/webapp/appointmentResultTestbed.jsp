<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	System.out.println(request.getParameter("state"));
	System.out.println(request.getParameter("district"));
	System.out.println(request.getParameter("vacc_center"));
%>

</body>
</html>