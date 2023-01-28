<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin login</title>
</head>
<body>
<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>

<h1 style="text-align: center;">Admin Login</h1>

<%
	String msg = request.getParameter("error");
	request.setAttribute("error", msg);
%>

<core:if test= "${error.isEmpty() == false}">
	<p><%=request.getParameter("error") %></p>
</core:if>


<form action="loginManager" method="post" style="border: 1px solid black;">
	<br/>
	<table style="margin-right: auto; margin-left:auto;">
	        <tr>
	            <td><label for="user">Admin Account: </label></td>
	        </tr>
	        <tr>
	            <td><input type="text" name="user" id="user" placeholder="User"></td>
	        </tr>
	
	        <tr>
	            <td><label for="password">Password: </label></td>
	        </tr>
	        <tr>
	            <td><input type="password" name="password" id="password" placeholder="Password"></td>
	        </tr>
	    </table>
	    <br />
	    <div style="text-align:center;"><input type="submit" value="Login"></div>
	    <br/>
	    
</form>

</body>
</html>