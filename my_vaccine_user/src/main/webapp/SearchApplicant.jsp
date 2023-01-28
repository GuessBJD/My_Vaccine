<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Search Applicant</title>
		<link href="BSS/css/bootstrap.min.css" rel="stylesheet">
		<link href="resources/SearchApplicant.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@page import="com.dao.ApplicantDao, com.dao.bean.Applicant, java.util.*" %>

<h1 class="SearchApplicant">My Vaccine Reservation System</h1>
<%  
	String Name = request.getParameter("name"); 
	String IC = request.getParameter("ic"); 

	String ic = (String)request.getParameter("ic");
	if(ic != null) 
	{
		out.println(ic);
	}
	
	String name = (String)request.getParameter("name");
	if(name == "name") 
	{
		out.println(name);
	}
 
	List<Applicant>list = ApplicantDao.getAllRecords();
	request.setAttribute("list", list);
%>


 <div class="Search">
	<div class="Search-triangle"></div>
		<h1 class="Search-header">Enter your IC Number and Name</h1>
			<form action="View_Applicant.jsp" method="post" >
				<input type="hidden"/>
				<p>IC NUMBER: <input type="text" name="ic" placeholder="IC NUMBER" class="searchic"></p>
				<p>NAME: <input type="text" name="name" placeholder="NAME" class="searchname" ></p>
				<input type="Submit" value="Search" class="Search">
				<button type="button" onClick="location.href='home.html'" class="Search">Cancel</button>
 			</form>	
	</div>
 


</body>
</html>