<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Insert Successful</title>
	
	<link href="BSS/css/bootstrap.min.css" rel="stylesheet">
	<link href="resources/addApplicantSuccess.css" rel="stylesheet" type="text/css">

</head>
	<body class="add-success">
		<h2 class>Record is saved. Click "Ok" to continue.</h2>
		
		<% 
			String ic = (String) request.getSession().getAttribute("ic");
    		request.getSession().setAttribute("ic", ic);
		%>
	
		<jsp:include page="viewApplicantInfo.jsp"></jsp:include>
		<button type="button" onClick="location.href='home.html'" class="continue">OK</button>
	</body>
</html>